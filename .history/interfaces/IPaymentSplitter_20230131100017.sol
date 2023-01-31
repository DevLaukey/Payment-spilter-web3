// SPDX-License-Identifier: GPL-3.0
// @author: Developed by Alex and Bunzz.
// @descpriton: Payment Splitter module for share revenue or salary with trasparency

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

interface IPaymentSplitter {
    event EthPaymentReleased(address account, uint256 amount);
    event ERC20PaymentReleased(
        IERC20 indexed token,
        address account,
        uint256 amount
    );

    /**
     * @dev Getter for the amount of shares held by an account.
     */
    function totalShares() external view returns (uint256);

    /**
     * @dev Getter for the amount of shares held by an account.
     */
    function shares(address account) external view returns (uint256);

    /**
     * @dev Getter for a payeer is enabled or not
     */
    function isEnabled(address account) external view returns (bool);

    /**
     * @dev Getter for a payeer is exists or not
     * @param account Payee address
     */
    function isPayee(address account) external view returns (bool);

    /**
     * @dev Getter for the amount of Ether already released to a payee.
     * @param account Payee address
     */
    function ethReleased(address account) external view returns (uint256);

    /**
     * @dev Getter for the amount of `token` tokens already released to a payee. `token` should be the address of an
     * IERC20 contract.
     * @param token IERC20 The address of the token contract
     * @param account address The address which will receive the tokens
     */
    function erc20Released(IERC20 token, address account)
        external
        view
        returns (uint256);

    /**
     * @dev Getter for the amount of payee's releasable Ether.
     * @param account The address of the payee to query.
     */
    function releasableEth(address account) external view returns (uint256);

    /**
     * @dev Getter for the amount of payee's releasable `token` tokens. `token` should be the address of an
     * IERC20 contract.
     * @param token IERC20 The address of the token contract
     * @param account address The address which will receive the tokens
     */
    function releasableERC20(IERC20 token, address account)
        external
        view
        returns (uint256);

    /**
     * @dev Getter for number of the payee address.
     */
    function payeeCount() external view returns (uint256);

    /**
     * @dev Transfers available Ether of the contract to all payees based on their shares
     */
    function releaseEth() external;

    /**
     * @dev Transfers available `token` tokens of the contract to all payees based on their shares
     */
    function releaseERC20(IERC20 token) external;

    function totalEthReleased() external view returns (uint256);

    function totalERC20Released(IERC20 token) external view returns (uint256);

    function totalEthWithdrawn() external view returns (uint256);

    function totalERC20Withdrawn(IERC20 token) external view returns (uint256);

    function listOfPayees() external view returns (address[] memory);

    function maxPayeeCounter() external view returns (uint256);
}