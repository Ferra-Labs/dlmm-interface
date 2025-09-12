module ferra_dlmm::bin_manager {

    use ferra_dlmm::pair_parameter_helper::{Self, PairParameters};
    use ferra_dlmm::rewarder::{Self, RewarderManager};
    use sui::clock::{Clock};
    use sui::table::{Self, Table};
    use sui::tx_context::TxContext;
    use std::u64::{Self};
    use std::u128::{Self};
    use std::vector;

    friend ferra_dlmm::lb_pair;
    friend ferra_dlmm::lb_position;

    struct BinManager has store {
        bins: Table<u32, PackedBins>,
    }

    struct PackedBins has store, drop {
        active_bins_bitmap: u8,
        bin_data: vector<Bin>,
    }

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

    public fun new(_ctx: &mut TxContext): BinManager {
        abort 0
    }

    public fun get_bin_from_pack(_packed: &PackedBins, _vector_index: u64): &Bin {
        abort 0
    }

    public(friend) fun bin_exists_in_pack(_packed: &PackedBins, _position_in_group: u8): bool {
        abort 0
    }

    public(friend) fun create_bin_in_pack(
        _packed: &mut PackedBins,
        _bin_id: u32,
        _position_in_group: u8,
        _bin_step: u16
    ) {
        abort 0
    }

    public(friend) fun get_bin(_bin_manager: &BinManager, _id: u32): &Bin {
        abort 0
    }

    public(friend) fun get_bin_mut(_bin_manager: &mut BinManager, _id: u32): &mut Bin {
        abort 0
    }

    public fun simulate_settle_active_bin_reward_growths(
        _bin: &Bin, 
        _reward_manager: &RewarderManager, 
        _clock: &Clock
    ): vector<u128> {
        abort 0
    }

    public(friend) fun settle_active_bin_reward_growths(
        _bin: &mut Bin, 
        _reward_manager: &mut RewarderManager, 
        _clock: &Clock
    ): vector<u128> {
        abort 0
    }

    public(friend) fun update_bin_reward_growths(_bin: &mut Bin, _reward_emissions: vector<u128>): vector<u128> {
        abort 0
    }

    public fun get_reward_growths(_bin: &Bin): vector<u128> {
        abort 0
    }

    public(friend) fun get_mut_reward_growths(_bin: &mut Bin): &mut vector<u128> {
        abort 0
    }


    public(friend) fun get_bin_reserves(_bin_manager: &BinManager, _id: u32): (u64, u64) {
        abort 0
    }

    public(friend) fun get_bin_reserves_supply(_bin_manager: &BinManager, _id: u32): (u64, u64, u128) {
        abort 0
    }

    public(friend) fun remove_bin(_bin_manager: &mut BinManager, _id: u32) {
        abort 0
    }

    public(friend) fun remove_bins(_bin_manager: &mut BinManager, _bin_ids: vector<u32>) {
        abort 0
    }

    public fun contains(_bin_manager: &BinManager, _id: u32): bool {
        abort 0
    }

    public fun get_next_non_empty_bin(
        _bin_manager: &BinManager,
        _swap_for_y: bool,
        _id: u32
    ): u32 {
        abort 0
    }

    public fun new_bin(_bin_id: u32, _reserve_x: u64, _reserve_y: u64, _price: u128): Bin {
        abort 0
    }

    public fun fee_growth_and_supply(_reserves: &Bin): (u128, u128, u128){
        abort 0
    }

    public(friend) fun subtract_bin(
        _bin: &mut Bin,
        _reserve_x: u64,
        _reserve_y: u64,
        _fee_x: u64,
        _fee_y: u64,
        _lp: u128
    ){
        abort 0
    }

    public fun get_price(_reserves: &Bin): u128 {
        abort 0
    }

    public fun get_reserves(_reserves: &Bin): (u64, u64) {
        abort 0
    }

    public fun get_total_amounts(_reserves: &Bin): (u64, u64) {
        abort 0
    }

    public fun get_fee_growth_x(_reserves: &Bin): u128 {
        abort 0
    }

    public fun get_fee_growth_y(_reserves: &Bin): u128 {
        abort 0
    }

    public(friend) fun add_fee_growth(_bin: &mut Bin, _fee_x: u64, _fee_y: u64) {
        abort 0
    }

    public fun get_total_supply(_reserves: &Bin): u128 {
        abort 0
    }

    public(friend) fun add_reserves_and_supply(
        _bin: &mut Bin,
        _add_reserve_x: u64,
        _add_reserve_y: u64,
        _add_supply: u128,
    ) {
        abort 0
    }

    public(friend) fun add_fees(
        _bin: &mut Bin,
        _add_fee_x: u64,
        _add_fee_y: u64
    ) {
        abort 0
    }

    public(friend) fun sub_fees(
        _bin: &mut Bin,
        _sub_fee_x: u64,
        _sub_fee_y: u64
    ) {
        abort 0
    }

    public(friend) fun update_reserves_fees(
        _bin: &mut Bin,
        _add_x: u64,
        _sub_x: u64,
        _add_y: u64,
        _sub_y: u64,
        _add_fee_x: u64,
        _add_fee_y: u64
    ) {
        abort 0
    }

    public fun bin_empty(_bin: &Bin): bool{
        abort 0
    }

    public fun get_amount_out_of_bin(
        _bin: &Bin,
        _amount_to_burn: u128,
        _total_supply: u128
    ): (u64, u64) {
        abort 0
    }

    public(friend) fun get_shares_and_effective_amounts_in(
        _bin: &Bin,
        _amount_x: u64,
        _amount_y: u64,
        _price: u128,
    ): (u128, u64, u64) {
        abort 0
    }

    public fun get_composition_fees(
        _bin: &Bin,
        _parameters: &PairParameters,
        _bin_step: u16,
        _amount_x: u64,
        _amount_y: u64,
        _total_supply: u128,
        _shares: u128
    ): (u64, u64) {
        abort 0
    }

    public fun get_liquidity_from_reserves(_reserves: &Bin, _price: u128): u128 {
        abort 0
    }

    public fun verify_lp_amounts(_amount_x: u64, _amount_y: u64, _active_id: u32, _id: u32) {
        abort 0
    }

    public fun is_empty(_bin: &Bin, _is_x: bool): bool {
        abort 0
    }

    public fun get_swap_amounts(
        _bin: &Bin,
        _parameters: &PairParameters,
        _bin_step: u16,
        _swap_for_y: bool,
        _amounts_in_left_x: u64,
        _amounts_in_left_y: u64
    ): (u64, u64, u64, u64, u64, u64) {
        abort 0
    }

}