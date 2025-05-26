// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract ClaimableTelegramNFT is ERC721URIStorage, Ownable {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;
    mapping(address => bool) public hasClaimed;

    string public baseURI;

    event NFTClaimed(address indexed user, uint256 tokenId);

    // Constructor: accepts base URI and sets initial owner
    constructor() ERC721("ClaimableTelegramNFT", "CTGNFT") Ownable(msg.sender) {
        baseURI = "ipfs://QmMockCID1234567890abcdef/"; // Mock base URI
    }

    // Owner can change base URI if needed
    function setBaseURI(string memory _baseURI) external onlyOwner {
        baseURI = _baseURI;
    }

    // Public claim function (only 1 NFT per address)
    function claimNFT() external {
        require(!hasClaimed[msg.sender], "You have already claimed your NFT");

        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();

        hasClaimed[msg.sender] = true;

        _mint(msg.sender, tokenId);
        _setTokenURI(tokenId, string(abi.encodePacked(baseURI, uint2str(tokenId))));

        emit NFTClaimed(msg.sender, tokenId);
    }

    // Internal utility function to convert uint to string
    function uint2str(uint256 _i) internal pure returns (string memory str) {
        if (_i == 0) return "0";
        uint256 j = _i;
        uint256 length;
        while (j != 0) {
            length++;
            j /= 10;
        }
        bytes memory bstr = new bytes(length);
        uint256 k = length;
        j = _i;
        while (j != 0) {
            bstr[--k] = bytes1(uint8(48 + j % 10));
            j /= 10;
        }
        str = string(bstr);
    }
}
