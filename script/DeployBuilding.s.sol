// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import {Building} from "../src/Building.sol";

contract DeployBuilding is Script {
    function run() external returns (Building) {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

        address elevatorAddr = 0x494D7561D93f39C3D1F7e00D907600D8829F5D29;

        vm.startBroadcast(deployerPrivateKey);
        Building building = new Building(elevatorAddr);
        vm.stopBroadcast();

        return (building);
    }
}

// forge script script/DeployBuilding.s.sol:DeployBuilding --rpc-url $SEPOLIA_RPC_URL --broadcast --verify -vvvv
