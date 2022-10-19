pragma solidity ^0.7.2;
contract Infection {
  string private payload; //state variable payload contains json-serialized data infection
  address payable private owner; //state variable owner contains owner's address
  //initialize contract
  constructor(string memory _payload) {
    owner = msg.sender; //assign ownership to the contract's creator <-- microservice
    payload = _payload; //write serialized json-serialized string into contract's storage
  }
  //PresenceHistory getter
  function getPresenceHistory() public view returns(string memory){
        return presence_history;
  }
  //destroy contract with expired information
  function destroy() external {
       require(msg.sender == owner); // only the microservice can destroy the contract
       selfdestruct(owner); 
  }
}