# File Structure

The FORENZA Android application uses a feature-based architecture.

```text
lib/
├── core/
│   ├── authorization/ (RoleService, permissions)
│   ├── constants/ (AppColors, AppTheme)
│   ├── router/ (GoRouter configuration)
│   └── services/ (OfflineVault, Sync, Crypto, Location)
│
├── models/
│   ├── case_model.dart
│   ├── evidence_model.dart
│   └── user_model.dart (Contains strict 7-role UserRole enum)
│
├── screens/
│   ├── auth/
│   ├── officer/ (Dashboard, Capture, Transfer)
│   ├── sync/
│   └── vault/ (Custodian dashboards)
│
└── main.dart (App Entry Point)
```

## Ownership Rules
- **Core Services** do not contain UI logic. They only handle pure data manipulation (Cryptography) or external communication (Supabase).
- **Screens** handle state management and rendering.
- **Models** handle raw data structures and JSON serialization.
