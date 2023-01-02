const DigitalArtNft = artifacts.require("DigitalArtNft");

module.exports = function (deployer) {
  deployer.deploy(DigitalArtNft);
};
