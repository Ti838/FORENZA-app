<div align="center">

  <img src="assets/logo.png" alt="FORENZA App" width="130" style="border-radius: 50%; box-shadow: 0 0 30px rgba(56, 189, 248, 0.4);" />

  <br/><br/>

  # 🛡️ FORENZA MOBILE APP
  ### *Zero-Trust Evidence Chain-of-Custody & Tamper-Evident Android Field Client*

</div>

---

## 📌 Executive Summary

**FORENZA APP** is the mobile field client of the FORENZA suite. Built with Flutter, it enables field investigators to securely capture evidence, track GPS coordinates, and maintain a mathematically defensible chain of custody—even offline.

---

## ⚡ Key Highlights

| Feature | Description |
| :--- | :--- |
| **Offline Sealing** | AES-256-GCM + Monotonic Sequence Counters for secure offline evidence capture. |
| **Tamper-Evident Capture** | SHA-256 integrity hashing directly on the device. |
| **Field-Optimized UX** | Camera-first workflows, GPS integration, and offline queueing. |

---

## 🏛️ System Architecture

FORENZA APP is built with **Flutter** for Android, integrating tightly with device hardware.

- **Frontend**: Flutter, Riverpod, GoRouter.
- **Hardware Integration**: Camera, Geolocator, Mobile Scanner (QR).
- **Backend Sync**: Supabase Flutter SDK for synchronization with the master database.

---

## 🚀 Quickstart & Deployment

### Prerequisites
* **Flutter SDK:** `>=3.16.0`
* **Android Studio / SDK:** Configured for Android development.

### 1. Clone & Configure
```bash
git clone https://github.com/Ti838/FORENZA-app.git
cd FORENZA-app
# Configure environment/dart defines as needed
```

### 2. Install Dependencies & Analyze
```bash
flutter pub get
flutter analyze
```

### 3. Run on Device/Emulator
```bash
flutter run
```

---

## 📚 Master Documentation Index

All technical documents are maintained in the `docs/` directory:

- [docs/ANDROID_ARCHITECTURE.md](docs/ANDROID_ARCHITECTURE.md)
- [docs/ANDROID_SETUP.md](docs/ANDROID_SETUP.md)
- [docs/ANDROID_FEATURES.md](docs/ANDROID_FEATURES.md)
- [docs/ANDROID_SECURITY.md](docs/ANDROID_SECURITY.md)
- [docs/ANDROID_OFFLINE.md](docs/ANDROID_OFFLINE.md)
- [docs/ANDROID_SYNC.md](docs/ANDROID_SYNC.md)
- [docs/ANDROID_EVIDENCE_CAPTURE.md](docs/ANDROID_EVIDENCE_CAPTURE.md)
- [docs/ANDROID_API.md](docs/ANDROID_API.md)
- [docs/ANDROID_AI.md](docs/ANDROID_AI.md)
- [docs/ANDROID_TESTING.md](docs/ANDROID_TESTING.md)
- [docs/ANDROID_BUILD.md](docs/ANDROID_BUILD.md)
- [docs/ANDROID_PERMISSIONS.md](docs/ANDROID_PERMISSIONS.md)

---

## 📜 Proprietary License & Ownership

**Copyright © 2024–2026 Timon Biswas. All Rights Reserved.**  
**Creator & Sole Rights Holder:** Timon Biswas (`timonbiswas33@gmail.com`)
