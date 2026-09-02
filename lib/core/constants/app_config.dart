import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  static const String appName = 'FORENZA';
  static const String appVersion = '1.0.0';

  // Supabase Backend Credentials
  static String get supabaseUrl => dotenv.env['SUPABASE_URL'] ?? 'https://xffidcqdhbmladtbvnyu.supabase.co';
  static String get supabaseAnonKey => dotenv.env['SUPABASE_ANON_KEY'] ?? 'sb_publishable_VW1KvSChtkkXjfFjFVLBWg_qUrqK9WD';

  // API Base URL
  static String get defaultApiBaseUrl => dotenv.env['API_BASE_URL'] ?? 'http://10.0.2.2:3000/api';

  // Geofence defaults
  static const double defaultGeofenceRadiusMeters = 500.0;
}
