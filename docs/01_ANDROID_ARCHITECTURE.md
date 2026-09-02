# Android Architecture

## Overview
FORENZA-app uses a feature-based architecture within the `lib/` directory.

```mermaid
graph TD
    UI[Flutter UI Layer] --> Core[Core Services]
    UI --> Models[Domain Models]
    Core --> Hashing[CryptoService / SHA-256]
    Core --> Vault[Offline Vault Service]
    Core --> Sync[Sync Engine / Supabase]
    
    Vault --> LocalDB[(Encrypted Storage)]
    Sync --> RemoteDB[(Supabase PostgreSQL)]
```

## Core Modules
- **CryptoService**: Handles canonical JSON serialization and SHA-256 hashing.
- **OfflineVaultService**: Manages the local AES-256 encrypted evidence vault.
- **SyncService**: Reconciles the offline vault with the remote Supabase database when network is available.
