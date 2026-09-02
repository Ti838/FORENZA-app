# Evidence Lifecycle & Integrity

## 1. Lifecycle
```text
Evidence Capture (Camera)
       ↓
Metadata Collection (Location, Timestamp)
       ↓
Canonicalization (JSON sorted keys)
       ↓
SHA-256 Hash Generation
       ↓
AES-256-GCM Encryption
       ↓
Local Secure Storage (Offline Vault)
       ↓
Sync Queue (Pending)
       ↓
Server Upload (Network Available)
       ↓
Server Verification
```

## 2. Evidence Integrity
The FORENZA app uses strict cryptographic hashing to prove evidence authenticity.
1. Immediately upon byte capture, a JSON object is created containing the raw bytes, timestamp, and location.
2. This JSON is canonicalized (sorted alphabetically, stripped of whitespace).
3. A SHA-256 hash is generated from the canonical string.
4. This hash acts as the absolute unique identifier. Any alteration of the image bytes, time, or location will completely change the hash, breaking the verification chain.
