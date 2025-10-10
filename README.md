# Ferra DLMM Interface Documentation

This repository contains the Move interface definitions for the Ferra Dynamic Liquidity Market Maker (DLMM) protocol. These interfaces provide type definitions and function signatures without implementations, allowing developers to build against the Ferra DLMM protocol without needing the full implementation.

## Contract Address

[0x5a5c1d10e4782dbbdec3eb8327ede04bd078b294b97cfdba447b11b846b383ac](https://suivision.xyz/package/0x5a5c1d10e4782dbbdec3eb8327ede04bd078b294b97cfdba447b11b846b383ac)

## Overview

The Ferra DLMM interface consists of four main modules:

1. **`lp_factory.move`** - Factory interface for creating and managing liquidity pairs
2. **`lb_pair.move`** - Main liquidity pair management interface (core trading and swap operations)
3. **`bin_manager.move`** - Bin management and liquidity operations interface (liquidity distribution and calculations)
4. **`lb_position.move`** - Liquidity Book Position management interface (user position tracking, fee collection, and reward distribution)

