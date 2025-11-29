import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AIService {
  // Simple placeholder: send message to configured AI gateway endpoint.
  // Configure VITE_AI_GATEWAY_URL (or AI_GATEWAY_URL) and API_KEY in .env
  static Future<String> sendMessage(String prompt) async {
    final url = dotenv.env['AI_GATEWAY_URL'];
    final apiKey = dotenv.env['AI_API_KEY'];
    if (url == null) throw Exception('AI_GATEWAY_URL not set');

    final res = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        if (apiKey != null) 'Authorization': 'Bearer $apiKey',
      },
      body: jsonEncode({'prompt': prompt}),
    );

    if (res.statusCode == 200) {
      final data = jsonDecode(res.body);
      // Expect { "response": "..." } or adjust as needed.
      return data['response']?.toString() ?? data.toString();
    } else {
      throw Exception('AI request failed: ${res.statusCode}');
    }
  }
}
