import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/place_model.dart';

class ApiService {
  static const String baseUrl = "http://10.104.220.239:5000/api";

  Future<List<Place>> fetchPlaces() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/places'));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return data.map((json) => Place.formJson(json)).toList();
      } else {
        throw Exception('Failed to load places');
      }
    } catch (e) {
      throw Exception('Error fetching places: $e');
    }
  }

  Future<bool> toggleFavorite(String placeId) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/favorites/toggle'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'placeId': placeId}),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception('Error toggling favorite: $e');
    }
  }

  Future<List<Place>> fetchFavorites() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/favorites'));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return data.map((fav) => Place.formJson(fav['placeId'])).toList();
      } else {
        throw Exception('Failed to load favorites');
      }
    } catch (e) {
      throw Exception('Error fetching favorites: $e');
    }
  }
}
