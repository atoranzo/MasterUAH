<template>
    <div>
        <top-menu></top-menu>

        <h2 v-show="!bcConnected && !bcConnectionError">
            Conectandose...
        </h2>

        <div class="main-content" v-show="bcConnected && !bcConnectionError">
            <router-view></router-view>
        </div>

        <div v-show="bcConnectionError" class="top-20">
            <h2>¡Error al conectarse a la blockchain!</h2>
            <h3 v-show="bcSmartContractAddressError">
                ¡Parece que la direción del smart contract es incorrecta!
            </h3>
            <p>
                Por favor chequee:
            </p>
            <ul>
                <li>Que la blockchain está funcionando.</li>
                <li>Que el puerto en tu configuración (file: <b>libs/mixinViews.js</b>) concuerde con la configuración de la blockchain.</li>
                <li>El archivo JSON compilado del smart contract (file: <b>assets/UsersContract.json</b>) está actualizado.</li>
            </ul>
        </div>
    </div>
</template>

<script>
    // importing common function
    import mixin from './libs/mixinViews';
    import TopMenu from './components/TopMenu';

    export default {
        components: { TopMenu },
        mixins: [mixin],

        name: 'App'
    }
</script>

<style>
    .main-content {
        padding:20px 40px;
    }
    h1.title {
        margin-bottom: 50px;
        padding-bottom: 10px;
        border-bottom: 1px solid #CCC;
    }
    .top-20 {
        margin-top: 20px;
    }
</style>
