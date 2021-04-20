// contracts/GameItem.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "github.com/openzeppelin/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";

contract GenericAssetContract is ERC721 {
    constructor() ERC721("GenericAsset", "GA") {
        
    }
    
    struct GenericAsset {
        string color;
        uint64 size;
    }
    
    mapping(uint64 => GenericAsset) public assets;

    function createAsset(uint64 itemId, address owner, string memory color, uint64 size)
        public
        returns (uint256)
    {
        // Assign the new asset to the owner
        _safeMint(owner, itemId);

        // Create the new asset
        GenericAsset memory _asset = GenericAsset({
            color: color,
            size: size
        });
        assets[itemId] = _asset;
        
        return itemId;
    }
}