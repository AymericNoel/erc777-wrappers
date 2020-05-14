pragma solidity ^0.5.0;

import "./SupervisedERC777Token.sol";


/**
 * @title Simple777Token
 * @dev Example of instantiation of the SupervisedERC777Token
 */
<<<<<<< HEAD
contract WrappedXRP is SupervisedERC777Token {
=======
contract WrappedADA is SupervisedERC777Token {
>>>>>>> 9382a0fbb3c47439b0e2c8b42cbdd085650af524

    /**
     * @dev Constructor that gives msg.sender all of existing tokens.
     */
    constructor () public SupervisedERC777Token("Trakx Wrapped ADA", "wADA") {}
}
