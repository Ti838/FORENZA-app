# Missing Functionality Analysis

| Feature | Status | Recommendation / Action |
|---------|--------|-------------------------|
| **Camera Evidence Capture** | `PARTIAL` | The UI exists, but the `camera` package must be hooked up to take actual photos and pass the raw bytes to the `OfflineVaultService`. |
| **SHA-256 Image Hashing** | `PARTIAL` | Logic exists, but needs to be triggered at the exact moment of camera capture before saving the file. |
| **Offline Vault** | `PARTIAL` | Encryption logic exists, but we need to integrate it with the camera workflow to actually store the captured photos. |
| **Supabase Cloud Sync** | `MISSING` | The app needs a `SyncService` to upload the encrypted files to Supabase Storage and insert metadata into the PostgreSQL database. |
| **Data Models** | `PARTIAL` | `UserModel`, `CaseModel`, `CustodyEventModel` are missing. Must implement them to match the backend schema. |
| **Authentication / RBAC** | `PARTIAL` | Need to fully hook up Supabase Auth to the Login UI and enforce role-based access. |
| **Chain of Custody** | `MISSING` | Requires backend support. Mobile needs a QR Code generator/scanner screen to facilitate physical handovers. |

**Immediate Action Plan:**
1. Implement the Real Camera inside `capture_screen.dart`.
2. Connect the Camera to `OfflineVaultService` to capture, hash, and encrypt the photo locally.
3. Build `sync_service.dart` to push the offline vault items to Supabase.
