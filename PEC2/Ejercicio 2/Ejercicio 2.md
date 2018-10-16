# Ejercicio 2 de la PEC2
## Alumno: Angel José Toranzo portela
### Dapp IPFS a partir de proyecto Truffle

Se va crear una aplicación distribuida en IPFS que permite votar cual de entre 2 series es la preferida del usuario. Las series son: Friends y How I Met Your Mother. La votación solo podrá ser realizada una vez por usuario de una cuenta Ethereum.

Se necesitan tener instaladas:

1. NodeJS
2. Truffle Framework
3. Ganache
4. Metamask Chrome Extension

en primer lugar vamos a añadir mi nombre a la pantalla de la aplicación como se nos pide. Esto se hace en el fichero index.html.

Captura 0

En segundo lugar vamos a ejecutar la aplicación en local host con los siguientes comandos:

1. npm install
2. truffle migrate --reset
3. npm run dev

captura 1

En tercer lugar se va a lanzar IPFS y su demonio:

1. ipfs init
2. ipfs daemon

captura 2

En cuarto lugar copiamos los ficheros JSON de los contratos y toda la carpeta /src dentro de la carpeta /dist. Una vez hecho esto añadimos la carpeta /dist a IPFScon el comando:

ipfs add -r dist/

captura 3

En quinto lugar copiamos el hash de la carpeta dist y lo publicamos en IPFS con el siguiente comando:

ipfs name publish QmWt5HWmUoV35Jn5X3zdo1EFX1L85PjV3kughj6tWC6Pef

captura 4

En sexto lugar para acceder a la Dapp desde el navegador escribimos:

gateway.ipfs.io/ipfs/{hash}

en nuestro caso sera:

gateway.ipfs.io/ipfs/QmWt5HWmUoV35Jn5X3zdo1EFX1L85PjV3kughj6tWC6Pef

Podemos ver que accedemos a la aplicación:

Captura 5

Esta cuenta se corresponde con la cuenta de Ganache. Para ello hemos tenido que importar esta cruenta "de prueba" de Ganache en metamask mediante su clave privada. Por otra parte hay que conectarse a la red RPC personalizada de Ganache desde Metamask.

Captura 6

En séptimo lugar ocurrirá que se desplegará Metamask en el navegador para que confirmemos la transacción previo pago de Ethers.

Captura 7

En octavo lugar podemos ver que una vez hecho esto la transacción quedará confirmada.

Captura 8

Y también la votación actualizada:

Captura 9

Por último si cogemos otra cuenta de Ethereum desde Metamask podremos ver que los datos se actualizan y nos dejará votar de nuevo ya que se trata de una aplicación que deja votar una vez por cuenta.

Captura 10

Captura 11







