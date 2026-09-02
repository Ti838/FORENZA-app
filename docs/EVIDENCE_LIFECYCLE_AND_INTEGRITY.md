# FORENZA-app Evidence Lifecycle & Integrity

The Chain of Custody and cryptographically verified integrity are the most critical components of the FORENZA platform. This document outlines the physical and digital lifecycle of evidence captured on the mobile app.

## Evidence State Machine

```mermaid
stateDiagram-v2
    [*] --> OFFLINE_CAPTURE : Officer snaps photo
    
    OFFLINE_CAPTURE --> HASH_GENERATED : SHA-256 calculated in RAM
    HASH_GENERATED --> VAULT_STORED : AES-256 encrypted on device
    
    VAULT_STORED --> SYNC_QUEUED : Network Restored
    SYNC_QUEUED --> UPLOADING_MEDIA : Pushing binary to Storage
    UPLOADING_MEDIA --> SYNCING_METADATA : Pushing JSON to DB
    
    SYNCING_METADATA --> CHAIN_SECURED : Supabase confirms receipt
    
    CHAIN_SECURED --> TRANSFER_INITIATED : Officer generates QR
    TRANSFER_INITIATED --> CUSTODY_TRANSFERRED : Custodian scans QR
    
    CUSTODY_TRANSFERRED --> [*] : Vault assumes legal custody
```

## The Cryptographic Guarantee

> [!IMPORTANT]
> Evidence is legally useless if it can be repudiated. FORENZA provides mathematically defensible evidence integrity.

1. **In-Memory Hashing:** The moment the camera shutter triggers, the binary blob is hashed (SHA-256) in RAM.
2. **Metadata Canonicalization:** The GPS coordinates, compass heading, timestamp (from GPS, not device clock), and the media hash are combined into a canonical JSON string.
3. **Master Hash:** A final SHA-256 hash is generated over the canonical metadata string.
4. **Offline Sealing:** This master hash is written to the encrypted SQLite database.

If a malicious actor roots the Android device and alters the photo file on the storage drive, the `master_hash` will fail verification during the upload process because the altered file's hash will not match the hash sealed in the metadata.

## QR Chain of Custody Handoff

```mermaid
sequenceDiagram
    actor Officer
    participant App as FORENZA App
    participant DB as Offline Vault
    actor Custodian

    Officer->>App: Click 'Transfer to Vault'
    App->>DB: Lock Evidence (State: TRANSFER_INITIATED)
    App-->>Officer: Display Secure QR Code (Includes Transfer Token)
    
    Note over Officer, Custodian: Physical Handoff occurs at Evidence Locker
    
    Custodian->>Custodian: Scans QR with Web App/Scanner
    Custodian->>DB: Acknowledges Receipt via Backend
    
    Note over App, DB: Next Sync Cycle
    DB-->>App: State updated to CUSTODY_TRANSFERRED
    App->>App: Removes evidence from Officer's active list
```
