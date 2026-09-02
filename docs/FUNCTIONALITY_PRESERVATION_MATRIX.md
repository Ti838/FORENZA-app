# Functionality Preservation Matrix

| Feature | Existing Implementation | Status Before | Action | Status After |
| ------- | ----------------------- | ------------- | ------ | ------------ |
| Cryptography | `CryptoService` canonical SHA-256 | IMPLEMENTED | Audited, retained | IMPLEMENTED |
| Offline Storage | `OfflineVaultService` | IMPLEMENTED | Connected to actual Camera | IMPLEMENTED |
| Map/GPS | `LiveMapScreen` / `LocationService` | PARTIALLY_IMPLEMENTED | Corrected dependencies | IMPLEMENTED |
| UI/Theming | `app_theme.dart` | BROKEN | Fixed const errors | IMPLEMENTED |
| Camera Capture | Mocked bytes | BROKEN | Implemented actual `camera` pkg | IMPLEMENTED |
| Sync | Mocked sync | MISSING | Implemented Supabase push | IMPLEMENTED |
