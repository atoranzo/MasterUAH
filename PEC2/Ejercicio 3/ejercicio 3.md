# Ejercicio 3 de la PEC2
## Alumno: Angel José Toranzo portela
### Dapp SWARM a partir del proyecto Truffle

Se va crear una aplicación distribuida en SWARM que permite votar cual de entre 2 series es la preferida del usuario. Las series son: Friends y How I Met Your Mother. La votación solo podrá ser realizada una vez por usuario de una cuenta Ethereum.

Se necesitan tener instaladas:

1. NodeJS
2. Geth
3. Metamask Chrome Extension

En primer lugar ejecutamos el cliente geth desde el terminal para la cuenta bcc778a30d2d5af7144dea8f984aad16b58f1b2c. El comando es:

geth --rinkeby --syncmode "fast" --rpc --rpcapi db,eth,net,web3,personal --cache=1024 --rpcport 8545 --rpcaddr 127.0.0.1 --rpccorsdomain "*" console

captura 1

En segundo lugar lanzamos la consola javascript de geth y comprobamos la cuenta. el comando es:

geth --rinkeby attach

Captura 2

En tercer lugar subimos a swarm el directorio Voting con la Dapp. El comando es:

swarm --recursive up ./Voting/

Swarm nos devolverá el HASH: 4cdc94a26df39a2d1d3f85e8ccfb759c0432c22b11ef136d6aabc2c9a07fd2ac

Captura 3

En cuarto lugar lanzamos el clinte swarm con la cuenta de geth ethereum bcc778a30d2d5af7144dea8f984aad16b58f1b2c. El comando es:


swarm --bzzaccount 0xbcc778a30d2d5af7144dea8f984aad16b58f1b2c --recursive --defaultpath Voting/

Captura 4

En quinto lugar accedemos a swarm a través del navegador teniendo en cuenta que no es como IPFS (estructura de directorios plana) ya que se respeta la estructura de los directorios. Por lo tanto accedemos desde el navegador de esta manera:

http://localhost:8500/bzz:/4cdc94a26df39a2d1d3f85e8ccfb759c0432c22b11ef136d6aabc2c9a07fd2ac/src/index.html

Captura 5

Para poder interactuar con lo blockchain ethereum vamos a tener que importar la clave provade de la cuenta bcc778a30d2d5af7144dea8f984aad16b58f1b2c. Para ello vamos al directorio ./ethereum/keystore y cogemos el archivo correpondiente a esta cuenta. La clave  privada corresponde con la etiqueta mac del archivo. Esto se puede ver en la siguiente captura:

Captura 6

Por último importamos en metamask  la clave privada: d7210443d15263f7b90ffb2411fffbb55e4d9cc58a0872f03ed3cb0c50eaf0f3 de la cuenta bcc778a30d2d5af7144dea8f984aad16b58f1b2c.














 







