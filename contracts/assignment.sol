// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "./ICompound.sol";

contract Assignment {
    address public cometAddress;

    constructor(address _cometAddress) {
        cometAddress = _cometAddress;
    }

    // Get the borrow collateral factor for a token
    function getBorrowCollateralFactor(address _tokenAddress)
        public
        view
        returns (uint256)
    {
        Comet comet = Comet(cometAddress);
        return
            comet.getAssetInfoByAddress(_tokenAddress).borrowCollateralFactor;
    }

    //  Supply an asset that this contract holds to Compound III
    function supply(address _tokenAddress, uint256 _tokenAmount) public {
        ERC20(_tokenAddress).approve(cometAddress, _tokenAmount);
        Comet(cometAddress).supply(_tokenAddress, _tokenAmount);
    }
    
    //  borrow baseToken from Compound III and transfer to this contract
    function withdraw(address _baseTokenAddress, uint _baseTokenAmount) public {
    Comet(cometAddress).withdraw(_baseTokenAddress, _baseTokenAmount);
    }





    // function getBorrowableAmount(address _userAddress)
    //     public
    //     view
    //     returns (uint256)
    // {
    //     Comet comet = Comet(cometAddress);
    //     uint8 numAssets = comet.numAssets();
    //     uint16 assetsIn = comet.userBasic(_userAddress).assetsIn;
    //     uint64 si = comet.totalsBasic().baseSupplyIndex;
    //     uint64 bi = comet.totalsBasic().baseBorrowIndex;
    //     address baseTokenPriceFeed = comet.baseTokenPriceFeed();

    //     int256 liquidity = int256(
    //         (presentValue(comet.userBasic(_userAddress).principal, si, bi) *
    //             int256(getCompoundPrice(baseTokenPriceFeed))) / int256(1e8)
    //     );

    //     for (uint8 i = 0; i < numAssets; i++) {
    //         if (isInAsset(assetsIn, i)) {
    //             CometStructs.AssetInfo memory asset = comet.getAssetInfo(i);
    //             uint256 newAmount = (uint256(
    //                 comet.userCollateral(_userAddress, asset.asset).balance
    //             ) * getCompoundPrice(asset.priceFeed)) / 1e8;
    //             liquidity += int256(
    //                 (newAmount * asset.borrowCollateralFactor) / 1e18
    //             );
    //         }
    //     }

    //     return liquidity;
    // }
}
