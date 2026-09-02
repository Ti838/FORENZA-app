# FORENZA Android Field Application

![FORENZA](https://via.placeholder.com/800x200.png?text=FORENZA+Field+Operations)

FORENZA is a professional-grade forensic evidence chain-of-custody and tamper-evident mobile application. Designed for field officers and investigators, it provides secure, offline-capable evidence capture, cryptographic integrity verification, and secure custody transfers.

## 🚀 Major Features
- **Secure Evidence Capture:** High-resolution photos with embedded, tamper-evident metadata.
- **Cryptographic Hashing (SHA-256):** Hashes are generated in-memory at the moment of capture to ensure absolute data integrity.
- **Offline Vault:** AES-256 encrypted local storage allows officers to operate in complete isolation (zero network connectivity).
- **Intelligent Synchronization:** Idempotent, collision-resistant queue synchronization when network is restored.
- **Chain of Custody (QR):** Securely transfer physical evidence custody between officers using QR code handovers.
- **Geofencing & Timestamping:** Immutable GPS and time logic tied to every action.

## 🛠 Technology Stack
- **Framework:** Flutter (>=3.16.0)
- **Language:** Dart (>=3.2.0)
- **State Management:** Riverpod
- **Routing:** GoRouter
- **Storage/DB:** SharedPreferences (Encrypted), SQLite
- **Security:** Dart Crypto (SHA-256)

## 🏗 Architecture
The app follows a strict Domain-Driven Design (DDD) layered architecture, separating UI (Presentation) from Business Logic (Core) and External Interfaces (API/Storage). 

Please see the comprehensive [Android Architecture Documentation](docs/ANDROID_ARCHITECTURE.md) for Mermaid diagrams and data flows.

## ⚙️ Setup & Installation

### Prerequisites
- Android Studio (Ladybug or newer)
- Flutter SDK & Dart SDK
- Physical Android device (Recommended for Camera/GPS testing)

### Environment Configuration
The application connects to the FORENZA Web/Supabase backend. Ensure your environment variables or Dart defines are set to point to your secure API.

### Run Commands
```bash
# 1. Fetch dependencies
flutter pub get

# 2. Run analysis to ensure clean code
flutter analyze

# 3. Run on connected device
flutter run
```

## 🧪 Testing
```bash
# Execute unit and widget tests
flutter test
```

## 📦 Building for Production
```bash
# Build Android APK (Debug/Testing)
flutter build apk --debug

# Build Android AppBundle (Google Play Release)
flutter build appbundle --release
```

## 🔗 Documentation Links
For deep dives into specific system components, refer to our detailed documentation:
- [Architecture & Diagrams](docs/ANDROID_ARCHITECTURE.md)
- [Security & Threat Model](docs/ANDROID_SECURITY.md)
- [Offline Vault & Sync Workflow](docs/ANDROID_OFFLINE.md)
- [Full Features List](docs/ANDROID_FEATURES.md)
- [Algorithm Audit](ALGORITHM_AUDIT.md)

---
*FORENZA System - Field Operations Client*
