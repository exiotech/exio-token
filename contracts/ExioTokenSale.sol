pragma solidity ^0.5.0;

import "./ExioToken.sol";

contract ExioTokenSale {
  address payable admin;
  ExioToken public tokenContract;
  uint256 public tokenPrice;
  uint256 public tokensSold;
  uint256 public tokensForSold;
  bool public isOpen;

  event Sell(address _buyer, uint256 _amount);
  event openSell(address _admin, uint256 _numberOfTokens);
  event closeSell(address _admin, uint256 _numberOfTokens);

  constructor(ExioToken _tokenContract, uint256 _tokenPrice) public {
    admin = msg.sender;
    tokenContract = _tokenContract;
    tokenPrice = _tokenPrice;
    isOpen = false;
  }

  function mulitply(uint x, uint y) internal pure returns (uint z) {
        require(y == 0 || (z = x * y) / y == x);
    }

  function buyTokens(uint256 _numberOfTokens) public payable {
    require(isOpen == true);
    require(msg.value == mulitply(_numberOfTokens,  tokenPrice));
    require(tokensForSold >= _numberOfTokens);
    require(tokenContract.transfer(msg.sender, _numberOfTokens));

    tokensSold += _numberOfTokens;
    emit Sell(msg.sender, _numberOfTokens);
  }

  function openSale(uint256 _numberOfTokens) public {
    require(msg.sender == admin);
    require(tokenContract.balanceOf(address(this)) >= _numberOfTokens);
    require(isOpen == false);

    tokensForSold = _numberOfTokens;
    isOpen = true;

    emit openSell(admin, _numberOfTokens);
  }

  function closeSale() public {
    require(msg.sender == admin);
    require(isOpen == true);
    // require(tokenContract.transfer(admin, tokenContract.balanceOf(address(this))));

    isOpen = false;
    tokensForSold = 0;

    emit closeSell(admin, tokenContract.balanceOf(address(this)));
  }

  function endSale() public {
    require(msg.sender == admin);
    require(tokenContract.transfer(admin, tokenContract.balanceOf(address(this))));

    selfdestruct(admin);
  }
}
