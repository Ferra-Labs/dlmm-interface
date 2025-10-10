module ferra_dlmm::lb_pair {
    use std::type_name::{TypeName};
    use sui::object::{UID, ID};
    use sui::coin::{Coin};
    use sui::balance::{Balance};
    use sui::tx_context::{TxContext};
    use sui::clock::{Clock};

    use ferra_dlmm::lb_position::{LBPosition};
    use ferra_dlmm::rewarder::{RewarderManager, RewarderGlobalVault};
    use ferra_dlmm::bin_manager::{BinManager};
    use ferra_dlmm::lb_position::{LBPositionManager};
    use ferra_dlmm::config::{GlobalConfig};
    use ferra_dlmm::pair_parameter_helper::{PairParameters};

    struct LBPair<phantom X, phantom Y> has key, store {
        id: UID,
        is_pause: bool,
        bin_step: u16,
        parameters: PairParameters,
        protocol_fee_x: u64,
        protocol_fee_y: u64,
        bin_manager: BinManager,
        position_manager: LBPositionManager,
        balance_x: Balance<X>,
        balance_y: Balance<Y>,
        reward_manager: RewarderManager
    }

    struct Amount has copy, drop {
        x: u64,
        y: u64,
    }

    struct FlashLoanReceipt {
        pair_id: ID,
        loan_x: bool,
        amount: u64,
        fee_amount: u64,
    }

    struct SwapEvent has copy, drop {
        sender: address,
        pair: ID,
        swap_for_y: bool,
        bin_ids: vector<u32>,
        amounts_in_x: vector<u64>,
        amounts_in_y: vector<u64>,
        amounts_out_x: vector<u64>,
        amounts_out_y: vector<u64>,
        total_fees_x: vector<u64>,
        total_fees_y: vector<u64>,
        protocol_fees_x: vector<u64>,
        protocol_fees_y: vector<u64>,
        volatility_accumulators: vector<u32>,
    }

    struct CollectedProtocolFeesEvent has copy, drop {
        fee_recipient: address,
        protocol_fees_x: u64,
        protocol_fees_y: u64,
    }

    struct ForcedDecayEvent has copy, drop {
        sender: address,
        id_reference: u32,
        volatility_reference: u32,
    }

    struct StaticFeeParametersSetEvent has copy, drop {
        sender: address,
        base_factor: u32,
        filter_period: u16,
        decay_period: u16,
        reduction_factor: u16,
        variable_fee_control: u32,
        protocol_share: u64,
        max_volatility_accumulator: u32,
    }

    struct CompositionFeesEvent has copy, drop {
        pair: ID,
        bin_id: u32,
        fee_x: u64,
        fee_y: u64,
    }

    struct FeesCollectedEvent has copy, drop {
        pair: ID,
        position: ID,
        bin_ids: vector<u32>,
        amount_x: u64,
        amount_y: u64,
    }

    struct RewarderAddedEvent has copy, drop {
        pair: ID,
        rewarder_type: TypeName,
    }

    struct RewardsCollectedEvent has copy, drop {
        pair: ID,
        position: ID,
        reward_type: TypeName,
        amount: u64,
    }

    struct PriceFromIdQueriedEvent has copy, drop {
        id: u32,
        price: u128,
    }

    struct IdFromPriceQueriedEvent has copy, drop {
        price: u128,
        id: u32,
    }

    struct FlashLoanEvent has copy, drop {
        pair: ID,
        loan_x: bool,
        amount: u64,
        fee_amount: u64,
    }
    
    struct OpenPositionEvent has copy, drop {
        pair: ID,
        position: ID,
        owner: address,
    }

    struct ClosePositionEvent has copy, drop {
        pair: ID,
        position: ID,
        owner: address,
    }

    struct AddLiquidityEvent has copy, drop {
        pair: ID,
        position: ID,
        ids: vector<u32>,
        amounts_x: vector<u64>,
        amounts_y: vector<u64>,
        tokens: vector<u128>,
    }

    struct RemoveLiquidityEvent has copy, drop {
        pair: ID,
        position: ID,
        ids: vector<u32>,
        tokens_x: u64,
        tokens_y: u64,
        token_bins_x: vector<u64>,
        token_bins_y: vector<u64>,
        liquidity_burned: vector<u128>,
    }

    struct LockPositionEvent has copy, drop {
        pair: ID,
        position: ID,
        lock_until: u64,
        owner: address,
    }

    struct PairPausedEvent has copy, drop {
        pair: ID,
        paused: bool,
    }

    public fun get_bin_manager<X, Y>(_pair: &LBPair<X, Y>): &BinManager {
        abort 0
    }

    public fun get_position_manager<X, Y>(_pair: &LBPair<X, Y>): &LBPositionManager {
        abort 0
    }

    public fun get_reward_manager<X, Y>(_pair: &LBPair<X, Y>): &RewarderManager {
        abort 0
    }

    public fun get_bin_step<X, Y>(_pair: &LBPair<X, Y>): u16 {
        abort 0
    }

    public fun get_range_id<X, Y>(_pair: &LBPair<X, Y>): (u32, u32) {
        abort 0
    }

    public fun get_active_id<X, Y>(_pair: &LBPair<X, Y>): u32 {
        abort 0
    }

    public fun get_bin<X, Y>(_pair: &LBPair<X, Y>, _id: u32): (u64, u64) {
        abort 0
    }

    public fun get_protocol_fees<X, Y>(_pair: &LBPair<X, Y>): (u64, u64) {
        abort 0
    }

    public fun get_price_from_id<X, Y>(_pair: &LBPair<X, Y>, _id: u32): u128 {
        abort 0
    }

    public fun get_id_from_price<X, Y>(_pair: &LBPair<X, Y>, _price: u128): u32 {
        abort 0
    }

    public fun get_swap_in<X, Y>(
        _pair: &LBPair<X, Y>,
        _amount_out: u64,
        _swap_for_y: bool,
        _clock: &Clock,
    ): (u64, u64, u64) {
        abort 0
    }

    public fun get_swap_out<X, Y>(
        _pair: &LBPair<X, Y>,
        _amount_in: u64,
        _swap_for_y: bool,
        _clock: &Clock,
    ): (u64, u64, u64) {
        abort 0
    }

    public(friend) fun new<X, Y>(
        _active_id: u32,
        _bin_step: u16,
        _base_factor: u32,
        _filter_period: u16,
        _decay_period: u16,
        _reduction_factor: u16,
        _variable_fee_control: u32,
        _protocol_share: u16,
        _max_volatility_accumulator: u32,
        _ctx: &mut TxContext,
    ): LBPair<X, Y> {
        abort 0
    }

    public fun swap<X, Y>(
        _config: &GlobalConfig,
        _pair: &mut LBPair<X, Y>,
        _swap_for_y: bool,
        _min_amount_out: u64,
        _coin_in_x: Coin<X>,
        _coin_in_y: Coin<Y>,
        _clock: &Clock,
        _ctx: &mut TxContext,
    ): (Coin<X>, Coin<Y>) {
        abort 0
    }

    public fun open_position<X, Y>(
        _config: &mut GlobalConfig,
        _pair: &mut LBPair<X, Y>,
        _ctx: &mut TxContext
    ): LBPosition {
        abort 0
    }

    public fun lock_position<X, Y>(
        _config: &mut GlobalConfig,
        _pair: &mut LBPair<X, Y>,
        _position: &mut LBPosition,
        _lock_until: u64,
        _clock: &Clock,
        _ctx: &mut TxContext
    ) {
        abort 0
    }

    public fun add_liquidity<X, Y>(
        _config: &GlobalConfig,
        _pair: &mut LBPair<X, Y>,
        _position: &mut LBPosition,
        _ids: vector<u32>,
        _dists_x: vector<u64>,
        _dists_y: vector<u64>,
        _coin_x: Coin<X>,
        _coin_y: Coin<Y>,
        _min_out_x: u64,
        _min_out_y: u64,
        _clock: &Clock,
        _ctx: &mut TxContext
    ): (Coin<X>, Coin<Y>) {
        abort 0
    }

    public fun remove_liquidity<X, Y>(
        _config: &GlobalConfig,
        _pair: &mut LBPair<X, Y>,
        _position: &mut LBPosition,
        _ids: vector<u32>,
        _min_amount_x: u64,
        _min_amount_y: u64,
        _clock: &Clock,
        _ctx: &mut TxContext
    ): (Coin<X>, Coin<Y>) {
        abort 0
    }

    public fun close_position<X, Y>(
        _config: &GlobalConfig,
        _pair: &mut LBPair<X, Y>,
        _position: LBPosition,
        _ctx: &mut TxContext
    ) {
        abort 0
    }

    public fun get_pending_fees<X, Y>(
        _pair: &LBPair<X, Y>,
        _position: &LBPosition,
        _bin_ids: vector<u32>
    ): (u64, u64) {
        abort 0
    }

    public fun collect_position_fees<X, Y>(
        _config: &GlobalConfig,
        _pair: &mut LBPair<X, Y>,
        _position: &mut LBPosition,
        _bin_ids: vector<u32>,
        _ctx: &mut TxContext
    ): (Coin<X>, Coin<Y>) {
        abort 0
    }

    public fun get_pending_rewards<X, Y, RewardCoin>(
        _pair: &LBPair<X, Y>,
        _position: &LBPosition,
        _bin_ids: vector<u32>,
        _clock: &Clock
    ): u64 {
        abort 0
    }

    public fun collect_position_rewards<X, Y, RewardCoin>(
        _config: &GlobalConfig,
        _pair: &mut LBPair<X, Y>,
        _bin_ids: vector<u32>,
        _position: &mut LBPosition,
        _vault: &mut RewarderGlobalVault,
        _clock: &Clock,
        _ctx: &mut TxContext
    ): Coin<RewardCoin> {
        abort 0
    }

    public fun get_reward_emission<X, Y, RewardCoin>(
        _pair: &LBPair<X, Y>,
        _clock: &Clock,
    ): u128 {
        abort 0
    }

    public fun flash_loan<X, Y>(
        _config: &GlobalConfig,
        _pair: &mut LBPair<X, Y>,
        _is_token_x: bool,
        _amount: u64,
    ): (FlashLoanReceipt, Coin<X>, Coin<Y>) {
        abort 0
    }

    public fun repay_flash_loan<X, Y>(
        _config: &GlobalConfig,
        _pair: &mut LBPair<X, Y>,
        _balance_x: Balance<X>,
        _balance_y: Balance<Y>,
        _receipt: FlashLoanReceipt,
    ) {
        abort 0
    }

    public fun get_position_bin_reserves<X, Y>(
        _pair: &LBPair<X, Y>,
        _position: &LBPosition,
        _id: u32
    ): (u64, u64) {
        abort 0
    }

    public fun get_position_reserves_for_bins<X, Y>(
        _pair: &LBPair<X, Y>,
        _position: &LBPosition,
        _ids: vector<u32>
    ): (vector<u64>, vector<u64>) {
        abort 0
    }
}