//SPDX-License-Identifier:MIT
pragma solidity >=0.4.0 <0.9.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol"; //importing ERC20 contract from Openzeppelin 
contract DEVToken is ERC20 {  
    constructor() ERC20("DEVToken","DEV") { //Token name is DEVToken. Symbol is DEV 
        _mint(msg.sender,3000*10**18); //miniting value is 3000 Tokens having decimals upto 18
    }
     // here mint function is to mint the tokens of given amount to valid address
    function mint(address _to,uint256 _amount) public returns(uint256){
       require(_to!=address(0),"Entered zero address");
       _mint(_to,_amount); //calls _mint function in ERC20 contract
       return _amount; //returns the number of tokens minted to _to address
    }
}