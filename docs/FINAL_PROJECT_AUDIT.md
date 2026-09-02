# Final Project Audit

### Implemented
- Canonical SHA-256 evidence hashing
- AES-256-GCM Offline Vault encryption
- Background Sync Service queue to Supabase
- GPS/Location capture integrated into metadata
- Camera package integration
- 7-Role strict RBAC model implemented in `UserModel` and `RoleService`

### Fixed
- Fixed all flutter syntax errors and missing imports.
- Fixed layout overflow issues on Capture and Dashboard screens.
- Fixed `app_theme.dart` const errors.

### Improved
- Extracted routing into `app_router.dart` and aligned with RoleService.
- Centralized constants and colors.
- Generated exhaustive documentation suite in `docs/`.

### Still Partial
- Judicial Chamber UI views exist conceptually but need explicit backend filters.

### Backend Dependencies
- Supabase PostgreSQL with configured RLS policies.
- AI Metadata processing needs to be proxied through the backend.

### Configuration Required
- Local `.env` needs `SUPABASE_URL`, `SUPABASE_ANON_KEY`, `GEMINI_API_KEY`, and `GOOGLE_MAPS_API_KEY`.

### Security Findings
- The `GEMINI_API_KEY` is currently loaded on the client side. This is documented in the Threat Model and Local Setup guides.

### Documentation Completed
- Full RBAC matrix, preservation matrix, offline syncing diagrams, and file structures.

### Future Work
- Move AI Proxy to Edge Function.
- Generate physical PDF dossiers.
- Create QR codes for physical bags linking to evidence IDs.
