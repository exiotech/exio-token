var ExioToken = artifacts.require("./ExioToken.sol");

module.exports = function(deployer) {
  deployer.deploy(ExioToken, 777777);
};
