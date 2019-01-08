var ExioToken = artifacts.require("./ExioToken.sol");
var ExioTokenSale = artifacts.require("./ExioTokenSale.sol");

module.exports = function(deployer) {
  deployer.deploy(ExioToken, 777777).then(function () {
    // Token price is 0.001 Ether
    var tokenPrice = 1000000000000000;
    return deployer.deploy(ExioTokenSale, ExioToken.address, tokenPrice);
  });
};
