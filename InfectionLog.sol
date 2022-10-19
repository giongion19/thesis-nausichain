pragma solidity ^0.7.2;
contract Infection {
    address payable private owner;
    //presenceHistory contains the infected user's presence data in json format
    event presenceLog(address indexed presenceContract, string presenceHistory);
    //initialize contract and create event
    constructor(string memory _payload) {
        owner = msg.sender;
        emit presenceLog(address(this), _payload);
    }
   function destroy() external {
       require(msg.sender == owner);
       selfdestruct(owner); 
    }
}