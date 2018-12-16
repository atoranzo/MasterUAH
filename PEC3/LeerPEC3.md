# Ejercicio PEC3
## Alumno: Angel José Toranzo portela
### Dapp Descentralizada a partir de la blockchain Ethereum y del framwork javascript Vuejs

###1)Introducción:
Se trata de una aplicación descentralizada muy simple  construida con Ethereum blockchain y VueJS de front-end. Esta DApp permite a los usuarios almacenar una versión simplificada de su CV en la cadena de bloques. Los campos que se van a capturar son del curriculum vitae son: la id de usuario, el nombre, estado laboral, educación, el teléfono, competencias profesionales, loa proyectos donde ha trabajado, la dirección del SmartContract, la fecha de creación y la fecha de modificacioón.

captura1

captura2

captura3




###2)Funcionamiento básico:

La  DApp va a permitir a los usuarios guardar los datos de su CV simplificados en una cadena de bloques. El perfil del usuario va a estar asociado a la dirección de su cuenta (o dirección de su billetera).

El propietario del perfil será la única persona que puede modificar los datos de su CV. Por lo tanto el SmartContract está diseñado para dar unicamente al usuario el control de sus propios datos ,hasta tal punto, que ni siquiera el creador del contrato inteligente puede controlar ningún dato.

###3)Requerimientos:

NPM (a partir de la version 5.8.0)
TRUFFLE (a partir de la version 4.1.5)
Una red privada con Ganache.
Metamask preferiblemente en el navegador chrome.

###4) Instalación básica:

1º Descomprimir la DApp en el directorio home
2º Iniciar ganache
3º) abrir un terminal de linux y en la ruta "~/ethereum-vuejs-dapp" ejecutar el comando: truffle console ––network ganache
captura 5
4º)Al iniciarse ganache ejecutar el comando "migrate ––reset ––compile-all" en la consola truffle
captura 6
5º) Si la migración es correcta copiar el fichero "Users.json" de la ruta "~/ethereum-vuejs-dapp/build/contracts/Users.json" dentro de la ruta "~/ethereum-vuejs-dapp/app-users/src/assets/UsersContract.json". Dentro de esta ruta sustituir el nombre de Users.json por UsersContract.json.

6º) Abrir otro terminal y dentro de la ruta "~/ethereum-vuejs-dapp" ejecutar el comando NPM INSTALL que instalará las dependencias necesarias de Vuejs. Una vez hecho esto  ejecutar el comando NPM RUN DEV.

Captura 8
captura 9

7º)Si todo ha funcionado correctamente saldrá un mensaje como el de la captura de pantalla

captura4

8º) Abrir el navegador chrome e introducir la dirección http://localhost:8080

9) para añadir más CVs hay que instalar metamask en el navegador y importar mas cuentas con fondos (por ejemplo importanto claves privadas de ganache que tienen 100 eth).Una vez cambiada a otra cuenta se podrá introducir otro CV teniendo en cuenta que se puede hacer uno por cuenta)
Recuerda al tratarse de una red privada generada en ganache hay que introducir la red de ganache y el puerto de este en metamask.

captura 7


###5) Ejemplo de grabación de un CV en la Blockchain privada de ganache:

1º) Grabamos los datos del CV en el formulario y le damos a grabar.

ejemplo1

2º) Confirmamos en metamask la operacion

ejemplo2
ejemplo3

3º) el formulario nos valida el registro del CV

ejemplo4

4º) pasado un tiempo el registro aparecere reflejado en la tabla.

ejemplo 9

5º) Para dar de alta otro registro tendremos que cambiar de cuenta pues solo se admite un Cv por cuenta.

ejemplo 7




