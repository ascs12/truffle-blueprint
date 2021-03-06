pragma solidity 0.5.2;

import "openzeppelin-solidity/contracts/token/ERC721/ERC721Full.sol";
import "openzeppelin-solidity/contracts/ownership/Ownable.sol";

/**
 * @title TanganyERC721
 * @dev Simple ERC721 Token example yielding a non-fungible token pre-assigned to its creator.
 */
contract TanganyERC721 is ERC721Full, Ownable {
    // modify token name
    string public constant NAME = "TanganyERC721";
    // modify token symbol
    string public constant SYMBOL = "TERC721";

    /**
     * @dev Constructor that gives msg.sender the non-fungible token.
     */
    constructor () public ERC721Full(NAME, SYMBOL) {
        super._mint(msg.sender, totalSupply().add(1));
    }

    function mint(address to) public onlyOwner {
        super._mint(to, totalSupply().add(1));
    }
}