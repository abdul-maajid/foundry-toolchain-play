// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

error TransferFailed();

contract StakeContract {
    mapping(address => mapping(address => uint256)) public s_balances;

    function stake(uint256 _amount, address _token) external returns (bool) {
        s_balances[msg.sender][_token] += _amount;
        bool success = IERC20(_token).transferFrom(
            msg.sender,
            address(this),
            _amount
        );
        if (!success) revert TransferFailed();
        return success;
    }
}
