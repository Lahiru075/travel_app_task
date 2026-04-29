import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import '../providers/place_provider.dart';
import '../widgets/favorite_card.dart';
import '../screens/details_screen.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritesAsync = ref.watch(favoritesProvider);

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

      body: favoritesAsync.when(
        data: (favoritePlaces) => favoritePlaces.isEmpty
            ? _buildEmptyState()
            : RefreshIndicator(
                onRefresh: () => ref.refresh(favoritesProvider.future),
                child: _buildFavoritesList(context, favoritePlaces),
              ),
        loading: () => _buildShimmerLoading(),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }

  Widget _buildEmptyState() {
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

  Widget _buildFavoritesList(BuildContext context, List favoritePlaces) {
    return ListView.builder(
      // eka line ekaka thiyenne ek item ekak witari
      padding: const EdgeInsets.all(16),
      itemCount: favoritePlaces.length,
      itemBuilder: (context, index) {
        final place = favoritePlaces[index];

        return GestureDetector(
          // card ek click kalama mokak hri deyak wenn oni nm mek use krnna puluwn
          onTap: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsScreen(place: place),
              ),
            );
          },
          child: FavoriteCard(place: place),
        );
      },
    );
  }

  Widget _buildShimmerLoading() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 5,
        itemBuilder: (context, index) => Container(
          height: 100,
          margin: const EdgeInsets.only(bottom: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
