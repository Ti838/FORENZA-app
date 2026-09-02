# Local Development

## Prerequisites
- **Flutter SDK**: 3.19.0 or higher
- **Dart SDK**: 3.3.0 or higher
- **Android Studio**: Latest with Android SDK 34+
- **Supabase Local CLI**: (Optional, if running backend locally)

## Running the App Locally
1. Clone the repository and navigate to the `FORENZA-app` directory.
2. Run `flutter pub get` to install dependencies.
3. Create a `.env` file based on `.env.example`.
4. Connect an Android physical device (Required for Camera functionality) or Emulator (Camera will be mocked).
5. Run `flutter run`.

## Verification Commands
- `flutter analyze` (Checks code quality)
- `flutter test` (Runs unit and widget tests)

## Known Local Limitations
- Gemini AI capabilities require a real API key in the `.env` file. Do not commit this key!
