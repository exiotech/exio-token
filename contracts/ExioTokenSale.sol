pragma solidity ^0.5.0;

import "./ExioToken.sol";

contract ExioTokenSale {
  address admin;
  ExioToken public tokenContract;
  uint256 public tokenPrice;

  constructor(ExioToken _tokenContract, uint256 _tokenPrice) public {
    admin = msg.sender;
    tokenContract = _tokenContract;
    tokenPrice = _tokenPrice;
  }
}
