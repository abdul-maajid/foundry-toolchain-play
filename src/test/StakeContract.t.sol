// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

import "ds-test/test.sol";
import "./utils/Cheats.sol";
import "../StackContract.sol";
import "./mocks/MockERC20.sol";

contract StakeContractTest is DSTest {
    CheatCodes public cheats;
    StakeContract public stakeContract;
    MockERC20 public mockToken;

    function setUp() public {
        cheats = CheatCodes(HEVM_ADDRESS);
        stakeContract = new StakeContract();
        mockToken = new MockERC20();
    }

    function testExample(uint32 amount) public {
        mockToken.approve(address(stakeContract), amount);
        bool stakePassed = stakeContract.stake(amount, address(mockToken));
        assertTrue(stakePassed);
    }
}
