require('dotenv').config()

import Web3 from 'web3'
import Generator from './build/contracts/Generator.json'

const web3 = new Web3(new Web3.providers.HttpProvider(process.env.WEB3_URL))s
const loomioContract = web3.eth.contract(Generator.abi).at(process.env.WEB3_ADDRESS);

web3.eth.defaultAccount = web3.eth.accounts[0]

export { loomioContract }
