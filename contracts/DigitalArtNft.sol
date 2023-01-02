// SPDX-License-Identifier: MIT
// author: achillegley
pragma solidity >=0.4.22 <0.9.0;

// Digital art NFT contract
contract DigitalArtNFT {
    // Mapping from token ID to token data
    mapping(uint256 => DigitalArt) public artworks;

    // Counter for the number of tokens
    uint public tokenCount;
    // Struct to store data for a digital art piece
    struct DigitalArt {
        address owner;
        string title;
        string artist;
        string imageUrl;
    }

    // Event for token minting
    event TokenMint(uint256 indexed _tokenId, address _owner, string _title, string _artist, string _imageUrl);

    // Event for token transfer
    event TokenTransfer(uint256 indexed _tokenId, address _from, address _to);

    // Mint a new token
    function mint(string memory _title, string memory _artist, string memory _imageUrl) public {
        uint256 newId = tokenCount + 1;
        artworks[newId] = DigitalArt(msg.sender, _title, _artist, _imageUrl);
        emit TokenMint(newId, msg.sender, _title, _artist, _imageUrl);
    }
}
   
