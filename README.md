# Ferra DLMM Interface Documentation

This repository contains the Move interface definitions for the Ferra Dynamic Liquidity Market Maker (DLMM) protocol. These interfaces provide type definitions and function signatures without implementations, allowing developers to build against the Ferra DLMM protocol without needing the full implementation.

## Contract Address

[0x01aca2702b2402f13eacdf9f3e49f5d1bdd3ec5cc7d11847cf8acbaef1cb6d5c](https://suivision.xyz/package/0x01aca2702b2402f13eacdf9f3e49f5d1bdd3ec5cc7d11847cf8acbaef1cb6d5c)

## Overview

The Ferra DLMM interface consists of four main modules:

1. **`lp_factory.move`** - Factory interface for creating and managing liquidity pairs
2. **`lb_pair.move`** - Main liquidity pair management interface (core trading and swap operations)
3. **`bin_manager.move`** - Bin management and liquidity operations interface (liquidity distribution and calculations)
4. **`lb_position.move`** - Liquidity Book Position management interface (user position tracking, fee collection, and reward distribution)

