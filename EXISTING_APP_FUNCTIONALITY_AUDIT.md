# Existing App Functionality Audit

## 1. Directory Structure
The application follows a standard Flutter structure with `lib/core`, `lib/models`, and `lib/screens`.
- `lib/core/services/` contains the core business logic.
- `lib/models/` currently only contains `evidence_model.dart`.
- `lib/screens/` contains UI shells for authentication, officer workflows, sync, and vault.

## 2. Implemented Services (Core Logic)
- **CryptoService (`crypto_service.dart`)**: Implements `generateEvidenceHash` for canonical JSON hashing (SHA-256) and `extendCustodyChain`. *(Status: Good, but needs integration with file bytes).*
- **OfflineVaultService (`offline_vault_service.dart`)**: Implements AES-256-GCM authentication encryption for media bytes using a derived key from the master hash. Saves files to the application documents directory. *(Status: Excellent forensic implementation).*
- **LocationService (`location_service.dart`)**: Implements GPS permission handling, live position streaming, and Haversine distance geofencing. *(Status: Fully functional).*
- **AiService (`ai_service.dart`)**: Directly calls the Google Gemini API using `http.post` for text/image analysis. *(Status: Functional, but bypasses the backend).*

## 3. UI & Screens
- **LiveMapScreen (`live_map_screen.dart`)**: Implements a full-screen Google Map with a live updating Geofence circle. *(Status: Functional).*
- **CaptureScreen / EmergencyCaptureScreen**: Existing shells for evidence capture. *(Status: Needs actual camera integration).*
- **SyncCenterScreen**: Shell for the synchronization queue. *(Status: Needs integration with Supabase storage).*

## 4. Environment & Dependencies
- `.env` and `flutter_dotenv` are correctly configured.
- `google_maps_flutter`, `supabase_flutter`, `geolocator`, `crypto`, and `camera` dependencies are present in `pubspec.yaml`.

## 5. Security & Threats
- **AI Keys**: `GEMINI_API_KEY` is stored in the mobile `.env`, which is a security risk for a production release.
- **Backend**: Supabase initialization is present in `main.dart`, but actual data synchronization (uploading evidence) is not fully implemented.

## Summary
The application has excellent *under-the-hood* forensic logic (Hashing, AES encryption, GPS). However, the *glue* connecting the UI (Camera) to the logic (Encryption) to the Backend (Supabase) is missing.
