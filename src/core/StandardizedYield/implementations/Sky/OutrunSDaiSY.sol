// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.26;

import { IERC4626 } from "@openzeppelin/contracts/interfaces/IERC4626.sol";

import { SYBase, ArrayLib } from "../../SYBase.sol";

contract OutrunSDaiSY is SYBase {
    address public immutable DAI;

    constructor(
        address _owner,
        address _DAI,
        address _sDAI
    ) SYBase("SY Sky Dai", "SY-sDAI", _sDAI, _owner) {
        DAI = _DAI;
    }

    function _deposit(
        address tokenIn,
        uint256 amountDeposited
    ) internal override returns (uint256 amountSharesOut) {
        if (tokenIn == DAI) {
            amountSharesOut = IERC4626(nativeYieldToken).deposit(amountDeposited, address(this));
        } else {
            amountSharesOut = amountDeposited;
        }
    }

    function _redeem(
        address receiver,
        address tokenOut,
        uint256 amountSharesToRedeem
    ) internal override returns (uint256 amountTokenOut) {
        if (tokenOut == DAI) {
            amountTokenOut = IERC4626(nativeYieldToken).redeem(amountSharesToRedeem, receiver, address(this));
        } else {
            _transferOut(nativeYieldToken, receiver, amountSharesToRedeem);
            amountTokenOut = amountSharesToRedeem;
        }
    }

    function exchangeRate() public view override returns (uint256 res) {
        return IERC4626(nativeYieldToken).convertToAssets(1 ether);
    }

    function _previewDeposit(
        address tokenIn,
        uint256 amountTokenToDeposit
    ) internal view override returns (uint256 amountSharesOut) {
        if (tokenIn == DAI) {
            amountSharesOut = IERC4626(nativeYieldToken).previewDeposit(amountTokenToDeposit);
        } else {
            amountSharesOut = amountTokenToDeposit;
        }
    }

    function _previewRedeem(
        address tokenOut,
        uint256 amountSharesToRedeem
    ) internal view override returns (uint256 amountTokenOut) {
        if (tokenOut == DAI) {
            amountTokenOut = IERC4626(nativeYieldToken).previewRedeem(amountSharesToRedeem);
        } else {
            amountTokenOut = amountSharesToRedeem;
        }
    }

    function getTokensIn() public view override returns (address[] memory res) {
        return ArrayLib.create(nativeYieldToken, DAI);
    }

    function getTokensOut() public view override returns (address[] memory res) {
        return ArrayLib.create(nativeYieldToken, DAI);
    }

    function isValidTokenIn(address token) public view override returns (bool) {
        return token == nativeYieldToken || token == DAI;
    }

    function isValidTokenOut(address token) public view override returns (bool) {
        return token == nativeYieldToken || token == DAI;
    }

    function assetInfo() external view returns (AssetType assetType, address assetAddress, uint8 assetDecimals) {
        return (AssetType.TOKEN, DAI, 18);
    }
}