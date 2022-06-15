# Code to interact with Raffle.sol as an external entity with no access to a gui

### The EnterRaffle.sol file can be used in remixIDE if the Raffle.sol is also copied over as the EnterRaffle.sol has an import"./Raffle.sol" dependency

### to use this code within visual studio code, clone the repository, then install hardhat depndencies via yarn add --dev hardhat

### now you will need the @chainlink/contract dependencies also, install via yarn add @chainlink/contracts

### you will now need to add your own .nev file with the usual RPC_URP, RINKEBY_API etc etc

### once you have these dependencies you should be able to deploy via yarn hardhat deploy --network rinkeby --verbose (use verbose to show the procces and highlight exactly where it throws an error if the code fails)
