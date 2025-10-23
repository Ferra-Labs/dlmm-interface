module ferra_dlmm::lp_factory {
    use ferra_dlmm::config::{GlobalConfig};
    use sui::table::{Table};
    use std::string::{String};
    use std::type_name::{TypeName};
    use sui::object::{UID, ID};
    use sui::tx_context::{TxContext};

    struct PairSimpleInfo has copy, drop, store {
        pair_id: ID,
        pair_key: ID,
        bin_step: u16,
        coin_type_a: TypeName,
        coin_type_b: TypeName
    }

    struct Pairs has key, store {
        id: UID,
        list: Table<ID, PairSimpleInfo>,
        index: u64,
    }

    struct InitFactoryEvent has copy, drop {
        pair_factory: ID,
    }

    struct CreatePairEvent has copy, drop {
        pair_id: ID,
        bin_step: u16,
        coin_type_a: String,
        coin_type_b: String,
        active_id: u32,
    }

    public fun create_pair<X, Y>(
        _config: &GlobalConfig,
        _pairs: &mut Pairs,
        _active_id: u32,
        _bin_step: u16,
        _ctx: &mut TxContext,
    ) {
        abort 0
    }

    public fun index(_pairs: &Pairs): u64 {
        abort 0
    }

    public fun coin_types(_pair_info: &PairSimpleInfo): (TypeName, TypeName) {
        abort 0
    }

    public fun new_pair_key<X, Y>(_bin_step: u16): ID {
        abort 0
    }

    public fun pair_id(_pair: &PairSimpleInfo): ID {
        abort 0
    }

    public fun pair_key(_pair: &PairSimpleInfo): ID {
        abort 0
    }

    public fun pool_simple_info(_pairs: &Pairs, _key: ID): &PairSimpleInfo {
        abort 0
    }

    public fun bin_step(_pair: &PairSimpleInfo): u32 {
        abort 0
    }
}