// SPDX-License-Identifier: agpl-3.0
pragma solidity ^0.6.6;

import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import  "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "../.././interfaces/aave/IFlashLoanReceiver.sol";
import "../.././interfaces/aave/ILendingPoolAddressesProvider.sol";
import "../.././interfaces/aave/ILendingPool.sol";

/** 
    !!!
    Never keep funds permanently on your FlashLoanReceiverBase contract as they could be 
    exposed to a 'griefing' attack, where the stored funds are used by an attacker.
    !!!
 */
abstract contract FlashLoanReceiverBase is IFlashLoanReceiver {
    using SafeERC20 for IERC20;
    using SafeMath for uint256;

    ILendingPoolAddressesProvider public immutable override ADDRESSES_PROVIDER;
    ILendingPool public immutable override LENDING_POOL;

    constructor(ILendingPoolAddressesProvider provider) public {
        ADDRESSES_PROVIDER = provider;
        LENDING_POOL = ILendingPool(provider.getLendingPool());
    }
}