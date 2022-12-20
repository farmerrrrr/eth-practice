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
