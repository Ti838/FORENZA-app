# Missing Functionality Analysis

### 1. Backend AI Proxy
**Why Required:** Currently, the GEMINI_API_KEY is placed in the mobile application's `.env` file. This exposes the secret.
**Status:** BACKEND_DEPENDENCY
**Recommendation:** Implement an edge function or secure API route on the FORENZA web backend to proxy AI requests.

### 2. PDF Dossier Generation
**Why Required:** Legal proceedings require printable, immutable reports.
**Status:** MISSING
**Recommendation:** Can be implemented locally using the `pdf` flutter package, generating a document containing the metadata, chain of custody logs, and evidence hash.

### 3. QR Code Generation for Physical Evidence
**Why Required:** To link physical evidence bags to digital records.
**Status:** MISSING
**Recommendation:** Generate QR strings from Evidence IDs using `qr_flutter`.

### 4. Comprehensive Unit Tests for Cryptography
**Why Required:** To mathematically prove the SHA-256 and AES-256-GCM algorithms are working exactly as required without regressions.
**Status:** MISSING
**Recommendation:** Implement test suites in `test/crypto_service_test.dart`.
