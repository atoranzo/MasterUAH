# Ejercicio 2 de la PEC1
## Alumno: Angel José Toranzo portela
### Sincronización con la red rinkeby

Iniciamos la sincronización mediante geth a la red Rinkeby mediante el comando:
- geth --rinkeby --syncmode "fast" --rpc --rpcapi db,eth,net,web3,personal --cache=1024  --rpcport 8545 --rpcaddr 127.0.0.1 --rpccorsdomain "*" console

captura 1

Obtenemos el address correspondiente al bloque genesis de la red rinkeby mediante geth





Obtenemos solo la cantidad de peers a los que estamos conectados con el comando *admin.peers* en la consola javascript:

Captura 4





Obtenemos información acerca de los bloques a los que estamos conectados indicando la altura máxima de bloque de los peers mediante el comando *eth.syncing*:

Captura 2






