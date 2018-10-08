# Ejercicio 2 de la PEC1
## Alumno: Angel José Toranzo portela
### Sincronización con la red rinkeby

Iniciamos la sincronización mediante geth a la red Rinkeby mediante el comando:
- geth --rinkeby --syncmode "fast" --rpc --rpcapi db,eth,net,web3,personal --cache=1024  --rpcport 8545 --rpcaddr 127.0.0.1 --rpccorsdomain "*" console

captura 1

![Iniciamos Sincronización](https://github.com/atoranzo/MasterUAH/blob/master/PEC1/Ejercicio%202/1.png)

Obtenemos el address correspondiente al bloque genesis de la red rinkeby mediante geth

Para ello ejecutamos el cmmando admin desde la consola javascript de genesis y en apartado protocols podemos ver la dirección genesis "0x6341fd3daf94b748c72ced5a5b26028f2474f5f00d824504e4fa37a75767e177"

Captura 3



Obtenemos solo la cantidad de peers a los que estamos conectados con el comando *admin.peers* en la consola javascript:

Captura 4

![cantidad peers](https://github.com/atoranzo/MasterUAH/blob/master/PEC1/Ejercicio%202/4.png)




Obtenemos información acerca de los bloques a los que estamos conectados indicando la altura máxima de bloque de los peers mediante el comando *eth.syncing*:

Captura 2

![Información bloques](https://github.com/atoranzo/MasterUAH/blob/master/PEC1/Ejercicio%202/2.png)





