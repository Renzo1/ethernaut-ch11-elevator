// SPDX-License-Identifier: UNLICENSED
pragma solidity "0.8.19";

interface IElevator {
    function top() external returns (bool);

    function floor() external returns (uint256);

    function goTo(uint256) external;
}

contract Building {
    IElevator elevator;
    bool public toggle = true;

    constructor(address _elevatorAddr) {
        elevator = IElevator(_elevatorAddr);
    }

    function isLastFloor(uint) external returns (bool) {
        toggle = !toggle;
        return toggle;
    }

    function goToTop(uint256 _floor) external {
        elevator.goTo(_floor);
    }
}
