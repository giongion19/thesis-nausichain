pragma solidity ^0.7.2;
import "Infection.sol";
contract InfectionManager {
  address payable private owner; //state variable owner contains owner's address
  //initialize contract
  constructor() {
    owner = msg.sender; //store contract owner <-- microservice
  }
  //create a new infection smart contract and return its address to caller 
  function newInfection(string memory _payload) external returns (address) {
    Infection infection = new Infection(_payload);
    address added = address(infection);
    return added; 
  }
  //destroy an expired smart contract whose address is given by the caller <-- microservice
  function removeInfection(address delendus) external {
    Infection history; 
    history = Infection(delendus); // this address can be given from caller
    history.destroy();
  }
}