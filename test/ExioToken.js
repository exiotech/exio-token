var ExioToken = artifacts.require("./ExioToken.sol");

contract('ExioToken', function(accounts) {
  it('sets the total supply upon deployment', function() {
    return ExioToken.deployed().then(function(instance) {
      tokenInstance = instance;
      return tokenInstance.totalSupply();
    }).then(function(totalSupply) {
      assert.equal(totalSupply.toNumber(), 777777, 'sets the total supply to 777,777');
    });
  });
});
