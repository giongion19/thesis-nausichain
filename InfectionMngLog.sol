// "SPDX-License-Identifier: UNLICENSED"
pragma solidity ^0.7.2;

import "./InfectionLog.sol";

contract InfrctionManagerLog { 
    
    address payable owner;  // it's payable to get the refund back from deleting the Infection contracts
    
    //stores contract owner <-- microservice
    constructor() {
       owner = msg.sender;
    }
   
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
 
    //function to create new infection smart contract
    function newInfection(string calldata payload) external returns(address) onlyOwner() {
        PresenceLog history = new PresenceLog(payload);
        address added = address(infection);
        return added; 
    }
    
    //function to destroy expired smart contracts
    function removeInfection(address delendus) external onlyOwner() {
        PresenceLog history; 
        history = PresenceLog(delendus); // this address can be given from caller
        history.destroy();
    }
}
