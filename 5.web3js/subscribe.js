import Web3 from "web3";
import InsertToDB from "./dbutils.js";
import * as consts from './constants.js';

const web3 = new Web3(new Web3.providers.WebsocketProvider(consts.default.WEB_SOCKET));

function Subscribe(contract_address, topic, type) {
    web3.eth.subscribe("logs", {
        address: contract_address,
        topics: [topic]
    }, (err, result)=>{
        if(err) {
            console.error(err);
        } else {
            console.log("***********************************************");
            console.log("New Transaction Event");
            console.log(type);
            console.log("***********************************************");
            getReceiptFindTransfer(result.transactionHash, type);
        }
    }
    ) 
}

async function getReceiptFindTransfer(txid, type) {
    web3.eth.getTransactionReceipt(txid)
    .then((result)=>{
        var logs = result.logs;
        for(const log of logs) {
            var topics = logs.topics;
            if(topics[0] == consts.default.TRANSFER_TOPIC) {
                console.log("***********************************************");
                console.log("Find TRANSFER Log");
                console.log("***********************************************");

                var before_owner = topics[1];
                var new_owner = topics[2];
                var token_id = topics[3];
                var contract_address = log.address;

                token_id = web3.utils.hexToNumberString(token_id);

                InsertToDB(contract_address, token_id, type, before_owner, new_owner);
            }
        }
    });
}

export default Subscribe;