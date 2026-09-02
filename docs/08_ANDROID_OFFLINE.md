# Offline Evidence Workflow

The FORENZA field application is built *offline-first*.

## Data Flow
```mermaid
sequenceDiagram
    participant Camera
    participant Vault
    participant Hash
    participant Storage
    
    Camera->>Vault: Provide Raw Bytes (Offline)
    Vault->>Hash: Generate Canonical SHA-256
    Hash-->>Vault: Hash Result
    Vault->>Storage: Encrypt & Save Locally
    Vault-->>Camera: Acknowledge Secure Save
```

When network is restored, the `SyncService` pulls all `syncPending` evidence and uploads them to Supabase, then marks them as `serverVerified`.
