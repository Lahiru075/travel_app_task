import 'package:flutter/material.dart';
import '../widgets/favorite_card.dart';
import '../models/place_model.dart';

class FavoritesScreen extends StatelessWidget {

  FavoritesScreen({super.key});

  final List<Place> favoritePlaces = globalFavorites; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: const Text(
          'My Favorites',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: favoritePlaces.isEmpty
      ? _buildEmptyState()
      : _buildFavoritesList(),
    );
  }

  Widget _buildEmptyState(){
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.favorite_outline_rounded,
              size: 100,
              color: Colors.grey[300],
            ),

            const SizedBox(height: 20),

            const Text(
              'No favorites yet!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "Explore the best places and tap the heart icon to save your favorite destinations here.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 14, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFavoritesList(){
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: favoritePlaces.length,
      itemBuilder: (context, index) {
        Place place = favoritePlaces[index];
        return FavoriteCard(place: place);
      },
    );
  }
}