module ferra_dlmm::config {
    use std::type_name::{TypeName};
    use sui::object::{UID, ID};
    use sui::vec_map::{VecMap};
    use sui::vec_set::{VecSet};
    use sui::tx_context::{TxContext};

    struct AdminCap has key, store {
        id: UID,
    }

    struct FeeParameters has copy, drop, store {
        base_factor: u32,
        filter_period: u16,
        decay_period: u16,
        reduction_factor: u16,
        variable_fee_control: u32,
        protocol_share: u16,
        max_volatility_accumulator: u32,
    }

    struct GlobalConfig has key, store {
        id: UID,
        pause: bool,
        bin_steps: VecMap<u16, FeeParameters>,
        flash_loan_enable: bool,
        flash_loan_fee_rate: u64,
        flash_loan_max_amount: u64,
        quote_asset_whitelist: VecSet<TypeName>,
        allow_create_pair: bool,
        package_version: u64,
    }

    struct InitConfigEvent has copy, drop {
        global_config_id: ID,
    }

    struct SetBinStepEvent has copy, drop {
        bin_step: u16,
        base_factor: u32,
        filter_period: u16,
        decay_period: u16,
        reduction_factor: u16,
        variable_fee_control: u32,
        protocol_share: u16,
        max_volatility_accumulator: u32,
    }

    struct DeleteBinStepEvent has copy, drop {
        bin_step: u16,
    }

    struct UpdateFlashLoanFeeRateEvent has copy, drop {
        old_fee_rate: u64,
        new_fee_rate: u64,
    }

    struct SetPackageVersion has copy, drop {
        new_version: u64,
        old_version: u64,
    }

    public fun add_update_bin_step(
        _config: &mut GlobalConfig,
        _bin_step: u16,
        _base_factor: u32,
        _filter_period: u16,
        _decay_period: u16,
        _reduction_factor: u16,
        _variable_fee_control: u32,
        _protocol_share: u16,
        _max_volatility_accumulator: u32,
        _ctx: &TxContext,
    ) {
        abort 0
    }

    public fun bin_step_exists(_config: &GlobalConfig, _bin_step: u16): bool {
        abort 0
    }

    public fun delete_bin_step(_config: &mut GlobalConfig, _bin_step: u16, _ctx: &TxContext) {
        abort 0
    }

    public fun base_factor(_config: &GlobalConfig, _bin_step: u16): u32 {
        abort 0
    }

    public fun filter_period(_config: &GlobalConfig, _bin_step: u16): u16 {
        abort 0
    }

    public fun decay_period(_config: &GlobalConfig, _bin_step: u16): u16 {
        abort 0
    }

    public fun reduction_factor(_config: &GlobalConfig, _bin_step: u16): u16 {
        abort 0
    }

    public fun variable_fee_control(_config: &GlobalConfig, _bin_step: u16): u32 {
        abort 0
    }

    public fun protocol_share(_config: &GlobalConfig, _bin_step: u16): u16 {
        abort 0
    }

    public fun max_volatility_accumulator(_config: &GlobalConfig, _bin_step: u16): u32 {
        abort 0
    }

    public fun flash_loan_fee_rate(_config: &GlobalConfig): u64 {
        abort 0
    }

    public fun flash_loan_max_amount(_config: &GlobalConfig): u64 {
        abort 0
    }

    public fun validate_bin_step(_binStep: u16) {
        abort 0
    }

    public fun add_whitelist_token<CoinType>(
        _config: &mut GlobalConfig,
        _ctx: &TxContext,
    ) {
        abort 0
    }

    public fun delete_whitelist_token<CoinType>(
        _config: &mut GlobalConfig,
        _ctx: &TxContext,
    ) {
        abort 0
    }

    public fun is_in_whitelist(_config: &GlobalConfig, _asset_type: TypeName): bool {
        abort 0
    }

    public fun whitelist_tokens(_config: &GlobalConfig): &VecSet<TypeName> {
        abort 0
    }

    public fun set_allow_create_pair(
        _config: &mut GlobalConfig,
        _allowed: bool,
        _ctx: &TxContext
    ) {
        abort 0
    }

    public fun get_allow_create_pair(_config: &GlobalConfig): bool {
        abort 0
    }

    public fun get_fund_receiver(_config: &GlobalConfig): address {
        abort 0
    }

    public fun get_reward_receiver(_config: &GlobalConfig): address {
        abort 0
    }

    public fun check_operator_role(_config: &GlobalConfig, _addr: address) {
        abort 0
    }

    public fun check_reward_role(_config: &GlobalConfig, _addr: address) {
        abort 0
    }

    public fun check_protocol_fee_role(_config: &GlobalConfig, _addr: address) {
        abort 0
    }

    public fun checked_package_version(_config: &GlobalConfig) {
        abort 0
    }

    public fun update_package_version(
        _config: &mut GlobalConfig,
        _new_version: u64,
        _ctx: &TxContext
    ) {
        abort 0
    }

    public fun package_version(): u64 {
        abort 0
    }
}