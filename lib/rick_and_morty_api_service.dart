import 'dart:convert';
import 'package:http/http.dart' as http;

class RickAndMortyApiService {
  static const String _baseUrl = 'https://rickandmortyapi.com/api';
  
  Future<dynamic> get(String endpoint) async {
    final response = await http.get(Uri.parse('$_baseUrl$endpoint'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
}