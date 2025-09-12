# Ferra DLMM Interface Documentation

This repository contains the Move interface definitions for the Ferra Dynamic Liquidity Market Maker (DLMM) protocol. These interfaces provide type definitions and function signatures without implementations, allowing developers to build against the Ferra DLMM protocol without needing the full implementation.

## Overview

The Ferra DLMM interface consists of three main modules:

1. **`lb_pair.move`** - Main liquidity pair management interface (core trading and swap operations)
2. **`bin_manager.move`** - Bin management and liquidity operations interface (liquidity distribution and calculations)
3. **`lb_position.move`** - Liquidity Book Position management interface (user position tracking, fee collection, and reward distribution)
