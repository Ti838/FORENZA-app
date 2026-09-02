# FORENZA Android Setup Guide

## Requirements
- **Flutter SDK:** >=3.16.0
- **Dart SDK:** >=3.2.0 <4.0.0
- **Android Studio:** Ladybug or newer (for Android toolchain)
- **Android SDK:** API 34+

## Environment Configuration
The application connects to the FORENZA Web/Supabase backend.

1. Ensure the `FORENZA-web` backend is running or deployed.
2. The Supabase connection details and API URLs must be configured.
3. Depending on the `lib/core/constants/app_config.dart` implementation, ensure your backend URLs are appropriately set (either via Dart Defines or hardcoded constants in development).

## Installation & Running

```bash
# Get dependencies
flutter pub get

# Run on a connected Android device or emulator
flutter run

# Run with specific Dart defines if required
flutter run --dart-define=API_URL=https://your-api.com
```

## Troubleshooting
- **Missing Android v1 embedding:** Ensure `android/app/src/main/AndroidManifest.xml` correctly references `android.app.Application` and the `MainActivity.kt` exists. This has been resolved in the main branch.
- **Gradle Network Timeouts:** Ensure you have an active internet connection so Gradle can download dependencies.
