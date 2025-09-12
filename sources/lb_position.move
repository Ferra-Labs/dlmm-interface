module ferra_dlmm::lb_position {
    use sui::object::{UID, ID};
    use sui::table::{Table};
    use sui::tx_context::{TxContext};
    use sui::clock::{Clock};
    use std::type_name::{TypeName};
    
    struct LBBinPosition has copy, drop, store {
        bin_id: u32,
        amount: u128,
        fee_growth_inside_last_x: u128,
        fee_growth_inside_last_y: u128,
        reward_growth_inside_last: vector<u128>,
    }

    struct PackedBins has store, drop {
        active_bins_bitmap: u8,
        bin_data: vector<LBBinPosition>,
    }

    struct LBPositionManager has store {
        positions: Table<ID, LBPositionInfo>,
    }

    struct LBPositionInfo has store {
        position_id: ID,
        pair_id: ID,
        bins: Table<u32, PackedBins>,
        toggle: u16
    }

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

    struct LB_POSITION has drop {}

    fun init(_witness: LB_POSITION, _ctx: &mut TxContext) {
        abort 0
    }
    
    public(friend) fun borrow_bin_mut(_manager: &mut LBPositionManager, _position: &LBPosition, _bin_id: u32): &mut LBBinPosition {
        abort 0
    }

    public(friend) fun borrow_bin(_manager: &LBPositionManager, _position: &LBPosition, _bin_id: u32): &LBBinPosition {
        abort 0
    }

    public(friend) fun contains_bin(_manager: &LBPositionManager, _position: &LBPosition, _bin_id: u32): bool {
        abort 0
    }

    public(friend) fun add_bin(
        _manager: &mut LBPositionManager,
        _position: &mut LBPosition,
        _bin_id: u32,
        _new_bin_data: LBBinPosition,
    ) {
        abort 0
    }

    public(friend) fun remove_bin(_manager: &mut LBPositionManager,
        _position: &mut LBPosition,
        _bin_id: u32
    ): bool {
        abort 0
    }

    public(friend) fun new(_ctx: &mut TxContext): LBPositionManager {
        abort 0
    }

    public fun pair_id(_position: &LBPosition): ID {
        abort 0
    }

    public(friend) fun open_position<X, Y>(
        _manager: &mut LBPositionManager,
        _pair_id: ID,
        _ctx: &mut TxContext,
    ): LBPosition {
        abort 0
    }

    public(friend) fun get_mut_position_saved_rewards(_position: &mut LBPosition): &mut vector<u64> {
        abort 0
    }

    public fun get_position_saved_rewards(_position: &LBPosition): vector<u64> {
        abort 0
    }

    public(friend) fun increase_bin_liquidity(
        _bin: &mut LBBinPosition,
        _additional_share: u128,
    ) {
        abort 0
    }

    public(friend) fun settle_position_fees(
        _position: &mut LBPosition,
        _bin: &mut LBBinPosition,
        _fee_growth_x: u128,
        _fee_growth_y: u128,
    ): (u64, u64) {
        abort 0
    }

    public fun simulate_settle_position_rewards(
        _bin: &LBBinPosition,
        _reward_growths: vector<u128>,
    ): vector<u64> {
        abort 0
    }

    public(friend) fun settle_position_rewards(
        _position: &mut LBPosition,
        _bin: &mut LBBinPosition,
        _reward_growths: vector<u128>,
    ) {
        abort 0
    }

    public(friend) fun increase_position_total_bins(_position: &mut LBPosition, _bins_number: u64) {
        abort 0
    }


    public(friend) fun borrow_position_info(
        _manager: &LBPositionManager, 
        _position: &LBPosition
    ): &LBPositionInfo {
        abort 0
    }

    public(friend) fun change_toggle(_position_info: &mut LBPositionInfo) {
        abort 0
    }

    public(friend) fun borrow_position_info_mut(
        _manager: &mut LBPositionManager,
        _position: &LBPosition,
    ): &mut LBPositionInfo {
        abort 0
    }

    public(friend) fun remove_bins(
        _manager: &mut LBPositionManager,
        _position: &mut LBPosition,
        _bin_ids: vector<u32>,
    ) {
        abort 0
    }

    public(friend) fun close_position(
        _manager: &mut LBPositionManager,
        _position: LBPosition,
    ) {
        abort 0
    }

    public fun is_empty_lp(_position_info: &LBPositionInfo): bool {
        abort 0
    }

    public fun is_empty_reward(_pos: &LBPosition): bool {
        abort 0
    }


    public fun position_token_amount(_bin: &LBBinPosition): u128 {
        abort 0
    }

    /// Get all active bins in a range
    public fun get_tokens_in_position(
        _manager: &LBPositionManager,
        _position: &LBPosition,
        _min_bin: u32,
        _max_bin: u32,
    ): (vector<u32>, vector<u128>) {
        abort 0
    }

    public(friend) fun get_pending_fees(
        _bin: &LBBinPosition,
        _current_fee_growth_x: u128,
        _current_fee_growth_y: u128,
    ): (u64, u64) {
        abort 0
    }

    public(friend) fun get_saved_fees(
        _position: &LBPosition,
    ): (u64, u64) {
        abort 0
    }

    public(friend) fun collect_saved_fees(
        _position: &mut LBPosition,
    ): (u64, u64) {
        abort 0
    }

    // Get pending rewards collected
    public(friend) fun get_saved_rewards(
        _position: &LBPosition,
        _rewarder_index: u64,
    ): u64 {
        abort 0
    }

    public(friend) fun collect_saved_rewards(
        _position: &mut LBPosition,
        _rewarder_index: u64,
    ): u64 {
        abort 0
    }

    public(friend) fun lock_position(_position: &mut LBPosition, _lock_until_timestamp: u64) {
        abort 0
    }

    public(friend) fun unlock_position(_position: &mut LBPosition) {
        abort 0
    }

    public fun is_position_locked(_position: &LBPosition, _clock: &Clock): bool {
        abort 0
    }

    public fun get_lock_until(_position: &LBPosition): u64 {
        abort 0
    }
}