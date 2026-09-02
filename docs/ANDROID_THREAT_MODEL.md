# Android Threat Model

## Threat: Offline Tampering
**Impact:** High. An attacker with physical access to the device might try to replace a locally saved photo before it syncs.
**Mitigation:** `OfflineVaultService` encrypts files using a key derived from the SHA-256 master hash. If the file is altered, the HMAC authentication tag will fail to decrypt, rendering the tampered evidence invalid.
**Remaining Limitation:** If a device is fully rooted, an attacker could extract the memory keys at runtime. 

## Threat: Stolen API Keys
**Impact:** Critical.
**Mitigation:** Only the Supabase `anon` key is bundled with the mobile application. The `service-role` key is strictly kept out of the repository.
**Remaining Limitation:** The `GEMINI_API_KEY` is currently loaded via `.env` on the client. In a production environment, AI processing should be proxied through the FORENZA backend to prevent leaking this private key.
