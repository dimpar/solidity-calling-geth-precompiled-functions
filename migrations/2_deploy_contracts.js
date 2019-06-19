const Precompile = artifacts.require("Precompile.sol");
// const TestContract = artifacts.require("Precompile2.sol");

module.exports = async function(deployer) {
  await deployer.deploy(Precompile);
  // await deployer.deploy(TestContract);

};
