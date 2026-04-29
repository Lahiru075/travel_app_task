import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/api_service.dart';
import '../models/place_model.dart';

final apiServiceProvider = Provider((ref) => ApiService());

final placesProvider = FutureProvider<List<Place>>((ref) async {
  final ApiService = ref.watch(apiServiceProvider);
  return await ApiService.fetchPlaces();
});

final favoritesProvider = FutureProvider<List<Place>>((ref) async {
  final ApiService = ref.watch(apiServiceProvider);
  return await ApiService.fetchFavorites();
});