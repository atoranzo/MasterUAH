# Ejercicio 1 - ENS

## Adquiera un dominio bajo el TLD '.test' en la testnet rinkeby

He adquirido el dominio 'myname.test' y lo he asociado a la cuenta '0xBcc778A30D2D5af7144Dea8f984aAd16B58F1B2c' Previamente tuve que obtener Ether para poder realizar la operación mediante la publicación de un mensaje en una cuenta de Twitter.

He abierto 2 terminales:

1. El primero para sincronizar el cliente geth con el siguiente comando:

geth --rinkeby --syncmode "fast" --rpc --rpcapi db,eth,net,web3,personal --cache=1024  --rpcport 8545 --rpcaddr 127.0.0.1 --rpccorsdomain "*" console 

Captura

2. El segundo con la consola javascript para poder trabajar con los comandos comodamente:

Se han utilizado los comandos que vienen en la web: 

http://docs.ens.domains/en/latest/quickstart.html


Se adjunto una captura con el terminal y los comandos utilizados para demostrar que se ha realizado el ejercido:



Captura


También se adjuntan capturas de las transacciones setResolver y publicResolver
registradas en https://etherscan.io/



Captura



Captura












