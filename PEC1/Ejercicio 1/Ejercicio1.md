# Ejercicio 1 de la PEC1
## Alumno: Angel José Toranzo portela
### Configurar una blockhain a través de un nodo propio Génesis

En primer lugar creo el directorio *my-eth-chain* que contengan los archivos necesarios. Voy a utilizar los comandos: 
- mkdir my-eth-chain
- cd my-eth-chain

A continuación creo el fichero génesis mediante el comando: 
- touch myGenesis.json. 

Dentro del fichero json introduzco el siguiente código:

captura 1

A continuación instanciamos el directorio de datos con el comando:
- geth --datadir ./home/che/my-eth-chain  init ./myGenesis.json

captura 2

Después inicializamos el nodo peer Ethereum con el comando:

- geth --datadir ./home/che/my-eth-chain --networkid 1114 console 2>> myEth.log

Captura 3

A continuación vamos a revisar la cuenta por defecto:
- eth.coinbase

captura 4

Para empezar a minar utilizamos el comando:
- eth.getBalance(eth.coinbase)

captura 5

Para ver el balance que variará a medida que minemos escribimos el comando:

- eth.getBalance(eth.coinbase)

Captura 6








 







