module ferra_dlmm::rewarder {
    use std::type_name::{TypeName};
    use std::option::{Option};
    use sui::object::{ID, UID};
    use sui::bag::{Bag};
    use sui::balance::{Balance};
    use sui::tx_context::{TxContext};
    use sui::clock::{Clock};

    use ferra_dlmm::config::{GlobalConfig};
    
    friend ferra_dlmm::lb_pair;
    friend ferra_dlmm::bin_manager;
    
    struct RewarderManager has store {
        rewarders: vector<Rewarder>,
        last_update_timestamp: u64,
    }
    
    struct Rewarder has copy, drop, store {
        emission_per_ms: u128, // emission rate scaled << 64
        reward_coin: TypeName
    }
    
    struct RewarderGlobalVault has key, store {
        id: UID,
        balances: Bag,
    }
    
    struct RewarderInitEvent has copy, drop {
        global_vault_id: ID
    }
    
    struct RewardEmissionUpdateEvent has copy, drop {
        pair: ID,
        reward_type: TypeName,
        old_emission: u128,
        new_emission: u128,
    }
    
    struct DepositEvent has copy, drop {
        vault: ID,
        reward_type: TypeName,
        amount: u64,
        total_balance: u64,
    }
    
    struct EmergentWithdrawEvent has copy, drop, store {
        reward_type: TypeName,
        withdraw_amount: u64,
        after_amount: u64,
    }

    fun init(_ctx: &mut TxContext) {
        abort 0
    }
    
    public(friend) fun new(): RewarderManager {
        abort 0
    }
    
    public(friend) fun add_rewarder<RewardCoin>(
        _manager: &mut RewarderManager
    ) {
        abort 0
    }
    
    public(friend) fun update_reward_emission<RewardCoin>(
        _vault: &RewarderGlobalVault,
        _manager: &mut RewarderManager,
        _pair_id: ID,
        _reward_emission: u128,
    ) {
        abort 0
    }

    public fun calc_reward_emission(
        _manager: &RewarderManager,
        _clock: &Clock
    ): vector<u128> {
        abort 0
    }

    public(friend) fun settle_reward(
        _manager: &mut RewarderManager,
        _clock: &Clock
    ): vector<u128> {
        abort 0
    }
    
    public fun rewarder_index<RewardCoin>(_manager: &RewarderManager): Option<u64> {
        abort 0
    }
    
    public fun deposit_reward<RewardCoin>(
        _global_config: &GlobalConfig,
        _vault: &mut RewarderGlobalVault,
        _reward: Balance<RewardCoin>
    ) {
        abort 0
    }
    
    public(friend) fun withdraw_reward<RewardCoin>(
        _vault: &mut RewarderGlobalVault,
        _amount: u64,
    ): Balance<RewardCoin> {
        abort 0
    }

    public fun emergent_withdraw<CoinType>(
        _global_config: &GlobalConfig,
        _vault: &mut RewarderGlobalVault,
        _amount: u64,
        _ctx: &mut TxContext
    ) {
        abort 0
    }
    
    public fun balance_of<RewardCoin>(_vault: &RewarderGlobalVault): u64 {
        abort 0
    }

    public(friend) fun get_reward_emission<RewardCoin>(_manager: &RewarderManager, _clock: &Clock): u128 {
        abort 0
    }
    
    public fun get_rewarders(_manager: &RewarderManager): &vector<Rewarder> {
        abort 0
    }
   
    fun rewarder_exists(_manager: &RewarderManager, _coin_type: TypeName): bool {
        abort 0
    }
    
    fun get_rewarder(_manager: &RewarderManager, _coin_type: TypeName): &Rewarder {
        abort 0
    }
    
    fun get_rewarder_mut(_manager: &mut RewarderManager, _coin_type: TypeName): &mut Rewarder {
        abort 0
    }
}