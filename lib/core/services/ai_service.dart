import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../constants/app_config.dart';

class AiService {
  final String _model = 'gemini-1.5-flash';
  
  Future<String> analyzeEvidence(String textDescription, {File? imageFile}) async {
    final apiKey = AppConfig.geminiApiKey;
    if (apiKey.isEmpty) {
      throw Exception('Gemini API key is not configured in .env');
    }

    final url = Uri.parse('https://generativelanguage.googleapis.com/v1beta/models/$_model:generateContent?key=$apiKey');
    
    List<Map<String, dynamic>> parts = [
      {
        'text': 'You are a forensic AI assistant. Analyze this evidence. Description provided by officer: $textDescription. Flag any discrepancies or confirm standard classification.'
      }
    ];

    if (imageFile != null) {
      final bytes = await imageFile.readAsBytes();
      final base64Image = base64Encode(bytes);
      parts.add({
        'inlineData': {
          'mimeType': 'image/jpeg',
          'data': base64Image
        }
      });
    }

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'contents': [
          {
            'parts': parts
          }
        ]
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final text = data['candidates'][0]['content']['parts'][0]['text'];
      return text;
    } else {
      throw Exception('Failed to analyze evidence: ${response.statusCode} - ${response.body}');
    }
  }
}
