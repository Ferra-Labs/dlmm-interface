module ferra_dlmm::pair_parameter_helper {
    struct PairParameters has store, copy, drop {
        base_factor: u32,
        filter_period: u16,
        decay_period: u16,
        reduction_factor: u16,
        variable_fee_control: u32,
        protocol_share: u64,

        // Dynamic parameters (change frequently)
        max_volatility_accumulator: u32,
        volatility_accumulator: u32,
        volatility_reference: u32,
        id_reference: u32,
        time_of_last_update: u64,
        active_id: u32
    }
}