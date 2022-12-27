import Web3 from "web3";
import * as consts from './constants.js';
import Subscribe from "./subscribe.js";

const web3 = new Web3(new Web3.providers.WebsocketProvider(consts.default.WEB_SOCKET));

const foundation_token_address = consts.default.FOUNDATION_TOKEN_ADDRESS;
const foundation_market_address = consts.default.FOUNDATION_MARKET_ADDRESS;

const transfer_topic = consts.default.TRANSFER_TOPIC;
const market_list_topic = web3.utils.sha3("ReserveAuctionCreated(address, address, uint256, uint256, uint256, uint256, uint256)");
const market_sold_topic = web3.utils.sha3("ReserveAuctionFinalized(uint256, address, address, uint256, uint256, uint256)");

Subscribe(foundation_token_address, transfer_topic, "TRANSFER");
Subscribe(foundation_market_address, market_list_topic, "TRANSFER");
Subscribe(foundation_market_address, market_sold_topic, "TRANSFER");