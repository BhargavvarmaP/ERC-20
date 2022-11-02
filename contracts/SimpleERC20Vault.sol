//SPDX-License-Identifier:MIT
pragma solidity >=0.4.0 <0.9.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract Vault  {
 
 ERC20 immutable public asset;
 constructor(ERC20 _asset) {
     asset=_asset;
 }
  mapping(address=>uint256) public Balances;
  function Deposit(uint256 _amount) public {
      require(_amount>0,"Enter Deposit amount");
      require(asset.balanceOf(msg.sender)>=_amount,"Insufficient funds");
      require(asset.approve(address(this), _amount),"Not Approved");
      require(asset.transferFrom(msg.sender,address(this),_amount),"Deposit failed");
        Balances[msg.sender]+=_amount;
  }
  function Withdraw(uint256 _amount) public {
      require(_amount>0,"Enter Deposit amount");
      require(Balances[msg.sender]>=_amount,"Insufficient Funds");
      require(asset.transferFrom(address(this),msg.sender,_amount),"Withdraw Failed");
      Balances[msg.sender]-=_amount;
  }
  function Balance() public view returns(uint256){
      return Balances[msg.sender];
  }
}