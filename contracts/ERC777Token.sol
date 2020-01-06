pragma solidity ^0.5.0;

import "@openzeppelin/contracts/access/Roles.sol";
import "@openzeppelin/contracts/token/ERC777/ERC777.sol";


/**
 * @title ERC777Token
 * @dev Simple ERC777 Token trial, where tokens should only get minted/burned by known EOA.
 * `ERC20` or `ERC777` functions.
 */
contract ERC777Token is ERC777, MinterRole {

    using Roles for Roles.Role;

    //Addresses allowed to add/remove minters
    Roles.Role private _admins;
    Roles.Role private _minters;
    Roles.Role private _burners;

    /**
     * @dev Constructor that gives _msgSender() all of existing tokens.
     */
    constructor (string memory name,
                string memory symbol)
                public ERC777(name, symbol, new address[](0)) {
        _admins.add(_msgSender());
        _minters.add(_msgSender());
        _burners.add(_msgSender());
    }


    modifier onlyAdmins() {
        require(_admins.has(_msgSender()), "Caller does not have the admin role");
        _;
    }

    modifier onlyMinters() {
        require(_minters.has(_msgSender()), "Caller does not have the minter role");
        _;
    }

    modifier onlyBurners() {
        require(_burners.has(_msgSender()), "Caller does not have the burner role");
        _;
    }

    // maybe need a superadmin to add remove admins
    // function addAdmin(address addressToAdd) public {
    //     require(_admin.has(_msgSender()), "Only admins can add new minters.");
    //     require(!_admin.has(addressToAdd),"Specified address is already an admin.");
    //     _admin.add(addressToAdd);
    // }

    function addMinter(address addressToAdd) public onlyAdmins {
        require(!_minters.has(addressToAdd),"Specified address is already a minter.");
        _minters.add(addressToAdd);
    }

    function addBurner(address addressToAdd) public onlyAdmins {
        require(!_burners.has(addressToAdd),"Specified address is already a minter.");
        _burners.add(addressToAdd);
    }

    function removeMinter(address addressToRemove) public onlyAdmins {
        require(_minters.has(addressToRemove),"Specified address is not a burner.");
        _minters.remove(addressToRemove);
    }

    function removeBurner(address addressToRemove) public onlyAdmins {
        require(_burners.has(addressToRemove),"Specified address is not a burner.");
        _burners.remove(addressToRemove);
    }
}