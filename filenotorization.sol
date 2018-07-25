
pragma solidity ^0.4.24;

//import './common/ownership/Ownable.sol';


contract ValidateDocument {

  struct User {
      address useraddress;
      mapping (bytes32 => validateDocument) validateDocuments;
  }
  struct validateDocument {
    string ipfsaddress;
    uint timeStamp;
  }


 // function setRegistrationPrice(uint _price) onlyOwner {
 // 		price = _price;
 // 	}


  mapping (address => User) public users;
  //mapping (address => validateDocument) public validateDocuments;
  //User[] users;

  event EntryAdded(bytes32 hash, uint blockNumber, uint timestamp);
  event EntryExistAlready(bytes32 hash, uint timenow);



  function newEntry (bytes32 _hashoffile, string _ipfsaddress) public {
      users[msg.sender].useraddress = msg.sender;
      users[msg.sender].validateDocuments[_hashoffile].ipfsaddress = _ipfsaddress;
      users[msg.sender].validateDocuments[_hashoffile].timeStamp = now;
      //users[msg.sender].validateDocuments[_hashoffile].hashlist[] = _ipfsaddress;

  }

  function checkHash (address _address, bytes32 _hashoffile) public constant returns(string, uint){
      return (users[_address].validateDocuments[_hashoffile].ipfsaddress,users[_address].validateDocuments[_hashoffile].timeStamp);
  }

  function checkexist (address _address, bytes32 _hashoffile) public constant returns (bool){
      return users[_address].validateDocuments[_hashoffile].timeStamp != 0;
  }

/*
function checkHash (address _address, bytes32 _hashoffile) public constant returns(bool){
    return (validateDocuments[_address].hashoffile) != _hashoffile;
    //uint index_count = validateDocuments[_address].hashoffile;

  }
  */
}
