<template>
	<div>
		<h1 class="title">Registro de Usuario</h1>

		<div class="row">
			<div class="col-md-3">

	            <div class="form-group">
	                <label for="description">Nombre</label>
	                <input class="form-control" placeholder="Introduzca su nombre" type="text" v-model="userName">
	            </div>

	            <div class="form-group">
	                <label for="description">Estado laboral</label>
	                <input class="form-control" placeholder="Introduzca su estado laboral" type="text" v-model="userStatus">
	            </div>
                
                <div class="form-group">
	                <label for="description">Educación</label>
	                <input class="form-control" placeholder="Introduzca su educación" type="text" v-model="userEducation">
	            </div>

               <div class="form-group">
	                <label for="description">Teléfono</label>
	                <input class="form-control" placeholder="Introduzca su teléfono" type="text" v-model="userPhone">
	            </div>

               <div class="form-group">
	                <label for="description">Competencias</label>
	                <input class="form-control" placeholder="Introduzca sus competencias" type="text" v-model="userCompetences">
	            </div>

               <div class="form-group">
	                <label for="description">Proyectos</label>
	                <input class="form-control" placeholder="Introduzca sus proyectos" type="text" v-model="userProjects">
	            </div>

	            <button class="btn btn-primary" :disabled="disableSubmit" @click="performSubmit">Register</button>
                <strong v-show="submitting">remitiendo...</strong>
                <strong v-show="errorSubmit" class="text-danger">¡!Ocurrió un error</strong>

                <p v-show="successMessage" class="text-success">
                    <strong>¡Has sido registrado correctamente!</strong>
                    <br>
                    ¡Será redirigido a la página de tu perfil <strong>ouna vez que el bloque sea minado!</strong>
                </p>
			</div>
		</div>
	</div>
</template>

<script>
    // importing common function
    import mixin from '../libs/mixinViews';

    export default {
        mixins: [mixin],

    	data() {
    		return {
    			userName: '', // variable binded with the input field: name
    			userStatus: '', // variable binded with the input field: status
                userEducation: '',
                userPhone: '',
                userCompetences: '',
                userProjects: '',
                submitting: false, // true once the submit button is pressed
                successMessage: false, // true when the user has been registered successfully

                tmoConn: null, // contain the intervalID given by setInterval
                tmoReg: null, // contain the intervalID given by setInterval
                errorSubmit: false, // it shows the erro message
    		}
    	},

    	computed: {
            /**
             * It disables the submit button when the the name or userStatus are not filled
             * or the submit button is pressed or the connection with the blockchin is
             * not established.
             */
            disableSubmit() {
                return (!this.userName.length || !this.userStatus.length || this.submitting || !this.blockchainIsConnected())
            }
        },

        methods: {
            /**
             * Perform the registration of the user when the submit button is pressed.
             */
        	performSubmit() {
                this.submitting = true
                this.errorSubmit = false
                this.successMessage = false

                // calling the function registerUser of the smart contract
                window.bc.contract().registerUser(
                    this.userName,
                    this.userStatus,
                    this.userEducation,  //this.education,
                    this.userPhone,
                    this.userCompetences,
                    this.userProjects,
                    {
                        from: window.bc.web3().eth.coinbase,
                        gas: 800000
                    },
                    (err, txHash) => {
                        if (err) {
                            console.error(err)
                            this.errorSubmit = true
                        }
                        else {
                            this.successMessage = true

                            // it emits a global event in order to update the top menu bar
                            Event.$emit('userregistered', txHash);

                            // the transaction was submitted and the user will be redirected to the
                            // profile page once the block will be mined
                            this.redirectWhenBlockMined()
                        }
                    }
                )
        	},

            /**
             * Check if the user visitng this page is registered: if the user is already
             * registered he will be redirected to the Profile page.
             */
            redirectIfUserRegistered() {
                this.tmoConn = setInterval(() => {
                    // checking first the connection
                    if (this.blockchainIsConnected()) {
                        // stopping the interval
                        clearInterval(this.tmoConn)

                        // calling the smart contract
                        window.bc.contract().isRegistered.call((error, res) => {
                            if (res) {
                                // redirecting to the profile page
                                this.$router.push("profile")
                            }
                        })
                    }
                }, 500)
            },

            /**
             * Once the user submitted his registration this funciton checks every 1000 ms
			 * if the registration is successfully. Once the user is registered he will be
			 * redirected to the profile page.
             *
             * NOTE: in order to check if the user has been registered successfully the
             * function has to check several time because the block can take several
             * minutes to be mined (depending on the the blockchain you are using).
             */
            redirectWhenBlockMined() {
                this.tmoReg = setInterval(() => {
                    if (this.blockchainIsConnected()) {
                        window.bc.contract().isRegistered.call((error, res) => {
                            if (error) {
                                console.error(error)
                            }
                            else if (res) {
                                // stopping the setInterval
                                clearInterval(this.tmoReg)

								// redirecting the user to the profile page
                                this.$router.push("profile")
                            }
                        })
                    }
                }, 1000)
            }
        },

        created() {
            // it checks every 500ms if the user is registered until the connection is established
            this.redirectIfUserRegistered()
        }
    }
</script>
