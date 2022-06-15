const { network } = require("hardhat")
const { developmentChains } = require("../helper-hardhat-config")
const { verify } = require("../utils/verify")


module.exports = async ({ getNamedAccounts, deployments }) => {
    const { deploy, log } = deployments
    const { deployer } = await getNamedAccounts()

    log("----------------------------------------------------")
    arguments = []
    const EnterRaffle = await deploy("EnterRaffle", {
        gasPrice: 2000000000,
        from: deployer,
        address: "0x13E431FCE386aFB5950e621594BF8Da0e6798d59",
        args: arguments,
        log: true,
        waitConfirmations: network.config.blockConfirmations || 1,
    })

    if (!developmentChains.includes(network.name) && process.env.ETHERSCAN_API_KEY) {
        log("Verifying...")
        await verify(EnterRaffle.address, arguments)
    }
    log("Contract deployed ....")
}

module.exports.tags = ["all", "EnterRaffle", "main"]
