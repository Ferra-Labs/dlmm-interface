module ferra_dlmm::rewarder {
    use sui::object::{UID, ID};
    use sui::coin::{Coin};
    use sui::tx_context::{TxContext};
    use std::type_name::{TypeName};
    use ferra_dlmm::config::{GlobalConfig};
    use sui::clock::{Clock};

    struct RewarderManager has store {
        id: UID,
        rewarders: vector<Rewarder>,
    }

    struct Rewarder has copy, drop, store {
        coin_type: TypeName,
        reward_factor: u128,
    }

    struct RewarderGlobalVault has key, store {
        id: UID,
    }

    struct RewarderInitEvent has copy, drop {
        vault_id: ID,
    }

    struct RewardFactorUpdateEvent has copy, drop {
        pair_id: ID,
        reward_coin_type: TypeName,
        old_reward_factor: u128,
        new_reward_factor: u128,
    }

    struct DepositEvent has copy, drop {
        vault_id: ID,
        coin_type: TypeName,
        amount: u64,
    }

    struct WithdrawEvent has copy, drop {
        vault_id: ID,
        pair_id: ID,
        coin_type: TypeName,
        recipient: address,
        amount: u64,
    }

    public fun rewarder_index<RewardCoin>(
        _manager: &RewarderManager
    ): u64 {
        abort 0
    }

    public fun calculate_reward_amount(
        _fee_amount: u128,
        _reward_factor: u128
    ): u64 {
        abort 0
    }

    public fun deposit_reward<RewardCoin>(
        _vault: &mut RewarderGlobalVault,
        _coin: Coin<RewardCoin>,
        _ctx: &mut TxContext
    ) {
        abort 0
    }

    public fun balance_of<RewardCoin>(
        _vault: &RewarderGlobalVault
    ): u64 {
        abort 0
    }

    public fun get_rewarders(
        _manager: &RewarderManager
    ): &vector<Rewarder> {
        abort 0
    }

    public fun get_reward_coin_type(
        _rewarder: &Rewarder
    ): TypeName {
        abort 0
    }

     public fun get_reward_emission<RewardCoin>(manager: &RewarderManager, clock: &Clock): u128 {
        abort 0
    }
   

    public fun create_rewarder_manager(_ctx: &mut TxContext): RewarderManager {
        abort 0
    }

    public fun add_rewarder<RewardCoin>(
        _manager: &mut RewarderManager,
        _reward_factor: u128,
        _ctx: &mut TxContext
    ) {
        abort 0
    }


    public fun withdraw_reward<RewardCoin>(
        _vault: &mut RewarderGlobalVault,
        _pair_id: ID,
        _recipient: address,
        _amount: u64,
        _ctx: &mut TxContext
    ): Coin<RewardCoin> {
        abort 0
    }
}