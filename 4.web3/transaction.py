from web3 import Web3
from web3.middleware import geth_poa_middleware
import json
from eth_account import Account

w3 = Web3(Web3.HTTPProvider('https://goerli.infura.io/v3/01ff5dcf66ce4347989a1ed3fd74c6e1'))
w3.middleware_onion.inject(geth_poa_middleware, layer=0)

f = open("key.txt", "rt")

private_key = f.readline()
account = Account.from_key(private_key)

print("######################################################################################")
print("Private key: ", private_key)
print("Account Address: ", account.address)
print("Account Balance: ", w3.eth.getBalance(account.address))
print("######################################################################################")

f.close()

f.open("address.txt", "rt")
addr = f.readline()

signedTransaction = w3.eth.account.sign_transaction(dict(
    nonce = w3.eth.getTransactionCount(account.address),
    gas = 100000,
    maxFeePerGas = 3000000000,
    maxPriorityFeePerGas = 3000000000,
    to = addr,
    value = w3.towei(0.001, 'ether'),
    data = b'first transaction',
    chainId = 5,
    type = 2
), private_key)

print("######################################################################################")
print(signedTransaction)
print("######################################################################################")

w3.eth.sendRawTransaction(signedTransaction.rawTransaction)

print(w3.eth.waitForTransactionReceipt(signedTransaction.hash, 500))

f.close()