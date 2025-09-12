# Ferra DLMM Interface Documentation

This repository contains the Move interface definitions for the Ferra Dynamic Liquidity Market Maker (DLMM) protocol. These interfaces provide type definitions and function signatures without implementations, allowing developers to build against the Ferra DLMM protocol without needing the full implementation.

## Overview

The Ferra DLMM interface consists of two main modules:

1. **`lb_position.move`** - Liquidity Book Position management interface
2. **`bin_manager.move`** - Bin management and liquidity operations interface

## Module: `ferra_dlmm::lb_position`

The `lb_position` module manages user positions in liquidity book pairs, including position creation, bin management, fee collection, and reward distribution.

### Core Structures

#### `LBPosition`
```move
struct LBPosition has key, store {
    id: UID,
    pair_id: ID,
    my_id: ID,
    saved_fees_x: u64, 
    saved_fees_y: u64,
    saved_rewards: vector<u64>,
    coin_type_a: TypeName,
    coin_type_b: TypeName,
    lock_until: u64,
    total_bins: u64
}
```
Represents a user's liquidity position with accumulated fees and rewards.

#### `LBPositionManager`
```move
struct LBPositionManager has store {
    positions: Table<ID, LBPositionInfo>,
}
```
Manages all positions for a liquidity book pair.

#### `LBBinPosition`
```move
struct LBBinPosition has copy, drop, store {
    bin_id: u32,
    amount: u128,
    fee_growth_inside_last_x: u128,
    fee_growth_inside_last_y: u128,
    reward_growth_inside_last: vector<u128>,
}
```
Represents a user's position in a specific bin.

### Key Functions

#### Position Management
- `open_position<X, Y>()` - Creates a new liquidity position
- `close_position()` - Closes and destroys an empty position
- `pair_id()` - Returns the pair ID for a position

#### Bin Operations
- `add_bin()` - Adds a new bin to a position
- `remove_bin()` - Removes a bin from a position
- `contains_bin()` - Checks if a position contains a specific bin
- `borrow_bin()` / `borrow_bin_mut()` - Borrows bin references

#### Fee Management
- `settle_position_fees()` - Settles accumulated fees for a position
- `get_saved_fees()` - Gets accumulated fees for a position
- `collect_saved_fees()` - Collects and resets accumulated fees

#### Reward Management
- `settle_position_rewards()` - Settles reward growth for a position
- `get_saved_rewards()` - Gets accumulated rewards for a specific rewarder
- `collect_saved_rewards()` - Collects and resets accumulated rewards

#### Position Locking
- `lock_position()` - Locks a position until a timestamp
- `unlock_position()` - Unlocks a position
- `is_position_locked()` - Checks if a position is locked

## Module: `ferra_dlmm::bin_manager`

The `bin_manager` module handles the core liquidity bin operations, including bin creation, reserves management, fee distribution, and swap calculations.

### Core Structures

#### `BinManager`
```move
struct BinManager has store {
    bins: Table<u32, PackedBins>,
}
```
Main structure managing all bins for a liquidity book pair.

#### `Bin`
```move
struct Bin has store, copy, drop {
    bin_id: u32,
    reserve_x: u64,
    reserve_y: u64,
    fee_x: u64,
    fee_y: u64,
    price: u128,
    fee_growth_x: u128,
    fee_growth_y: u128,
    reward_growths: vector<u128>,
    total_supply: u128,
}
```
Represents a single liquidity bin with reserves, fees, and supply tracking.

#### `PackedBins`
```move
struct PackedBins has store, drop {
    active_bins_bitmap: u8,
    bin_data: vector<Bin>,
}
```
Efficiently packs multiple bins using bitmap indexing.

### Key Functions

#### Bin Management
- `new()` - Creates a new BinManager
- `new_bin()` - Creates a new bin with specified parameters
- `get_bin()` / `get_bin_mut()` - Gets references to bins
- `contains()` - Checks if a bin exists
- `remove_bin()` / `remove_bins()` - Removes bins from management

#### Reserve Operations
- `get_reserves()` - Gets reserve amounts (excluding fees)
- `get_total_amounts()` - Gets total amounts (reserves + fees)
- `add_reserves_and_supply()` - Adds reserves and updates supply
- `subtract_bin()` - Subtracts amounts from bin reserves

#### Fee Management
- `add_fee_growth()` - Updates fee growth tracking
- `get_fee_growth_x()` / `get_fee_growth_y()` - Gets fee growth values
- `add_fees()` / `sub_fees()` - Manages fee amounts

#### Liquidity Calculations
- `get_shares_and_effective_amounts_in()` - Calculates shares for liquidity provision
- `get_amount_out_of_bin()` - Calculates amounts when removing liquidity
- `get_composition_fees()` - Calculates composition fees for imbalanced deposits
- `get_liquidity_from_reserves()` - Calculates liquidity from reserve amounts

#### Swap Operations
- `get_swap_amounts()` - Calculates swap input/output amounts with fees
- `get_next_non_empty_bin()` - Finds next available bin for swapping
- `verify_lp_amounts()` - Validates liquidity provision amounts

#### Reward Management
- `settle_active_bin_reward_growths()` - Updates reward growth for active bins
- `simulate_settle_active_bin_reward_growths()` - Simulates reward settlements
- `get_reward_growths()` - Gets current reward growth values

## Usage

These interface files are designed to be used as dependencies for Move projects that interact with the Ferra DLMM protocol. They provide:

1. **Type Safety** - Full type definitions for all structs and function signatures
2. **API Documentation** - Clear function signatures showing expected parameters and return types
3. **Compilation Support** - Allows dependent projects to compile without full implementation
4. **Development Efficiency** - Enables development against stable interfaces

### Integration Example

```move
use ferra_dlmm::lb_position::{Self, LBPosition, LBPositionManager};
use ferra_dlmm::bin_manager::{Self, BinManager, Bin};

// Example: Check position fees
public fun check_position_fees(
    position: &LBPosition
): (u64, u64) {
    lb_position::get_saved_fees(position)
}

// Example: Get bin reserves
public fun get_bin_info(
    manager: &BinManager,
    bin_id: u32
): (u64, u64, u128) {
    bin_manager::get_bin_reserves_supply(manager, bin_id)
}
```

## Friend Modules

Both modules declare friend relationships with:
- `ferra_dlmm::lb_pair` - Main pair management module
- `ferra_dlmm::lb_position` - Cross-references between modules

These friend relationships allow controlled access to internal functions while maintaining encapsulation.

## Error Codes

### lb_position Module
- `E_INVALID_BIN_ID = 1` - Invalid bin identifier
- `E_POSITION_TOTAL_BINS_EXCEEDED = 2` - Position has too many bins
- `E_POSITION_NOT_FOUND = 3` - Position not found in manager
- `E_POSITION_NOT_EMPTY = 4` - Attempting to close non-empty position

### bin_manager Module
- `E_COMPOSITION_FACTOR_FLAWED = 700` - Invalid composition in liquidity provision
- `E_MAX_LIQUIDITY_PER_BIN_EXCEEDED = 702` - Bin liquidity limit exceeded
- `E_SHARES_TOO_LARGE = 705` - Share amount exceeds maximum allowed
- `E_INVALID_BIN_ID = 706` - Invalid bin identifier
- `E_INVALID_POSITION = 708` - Invalid position parameter

## Constants

### bin_manager Module
- `MAX_SHARES_PER_MINT = 0x400000000` - Maximum shares that can be minted at once
- `MIN_INITIAL_SHARE = 1000` - Minimum initial shares for first liquidity provision

## Notes

- All functions in these interface modules return `abort 0` as they contain no implementation
- The interfaces maintain all original function signatures, visibility modifiers, and type parameters
- These interfaces are suitable for type checking, compilation, and API documentation
- For actual functionality, use the full implementation modules

## License

This interface documentation is provided for development purposes. Please refer to the main Ferra protocol repository for licensing information.