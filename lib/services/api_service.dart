import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_app_task/services/auth_service.dart';
import '../models/place_model.dart';

class ApiService {
  static const String baseUrl = "http://10.104.220.239:5000/api";

  Future<Map<String, String>> _getHeaders() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('accessToken');
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  Future<List<Place>> fetchPlaces() async {
    final headers = await _getHeaders();
    final response = await http.get(
      Uri.parse('$baseUrl/places'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Place.formJson(json)).toList();
    } else if (response.statusCode == 401) {
      final newToken = await AuthService().refreshAccessToken();
      if (newToken != null) {
        return fetchPlaces();
      } else {
        throw Exception('Session Expired. Please Login again.');
      }
    } else {
      throw Exception('Failed to load places');
    }
  }

  Future<bool> toggleFavorite(String placeId) async {
    final headers = await _getHeaders();
    final response = await http.post(
      Uri.parse('$baseUrl/favorites/toggle'),
      headers: headers,
      body: json.encode({"placeId": placeId}),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else if (response.statusCode == 401) {
      final newToken = await AuthService().refreshAccessToken();
      if (newToken != null) {
        return toggleFavorite(placeId); // Retry
      } else {
        throw Exception('Session Expired. Please Login again.');
      }
    } else {
      return false;
    }
  }

  Future<List<Place>> fetchFavorites() async {
    final headers = await _getHeaders();
    final response = await http.get(
      Uri.parse('$baseUrl/favorites/user'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((fav) => Place.formJson(fav['placeId'])).toList();
    } else if (response.statusCode == 401) {
      
      final newToken = await AuthService().refreshAccessToken();
      if (newToken != null) {
        return fetchFavorites(); // Retry
      } else {
        throw Exception('Session Expired. Please Login again.');
      }
    } else {
      return [];
    }
  }
}
