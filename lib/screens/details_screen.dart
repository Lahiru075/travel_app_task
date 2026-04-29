import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/place_provider.dart';
import '../widgets/facility_chip.dart';
import '../models/place_model.dart';

class DetailsScreen extends ConsumerStatefulWidget {
  final Place place;
  const DetailsScreen({super.key, required this.place});

  @override
  ConsumerState<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends ConsumerState<DetailsScreen> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = false;
    _checkIfFavorite();
  }

  void _checkIfFavorite() {
    final favorites = ref.read(favoritesProvider).value ?? [];
    setState(() {
      isFavorite = favorites.any((item) => item.id == widget.place.id);
    });
  }

  Future<void> _handleFavoriteToggle() async {
    setState(() {
      isFavorite = !isFavorite;
    });

    final success = await ref.read(apiServiceProvider).toggleFavorite(widget.place.id);

    if (success) {
      ref.invalidate(favoritesProvider);
    } else {
      setState(() {
        isFavorite = !isFavorite;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to toggle favorite')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Image Section with Back and Favorite buttons
            Stack(
              children: [
                Hero(
                  tag: widget.place.id,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 50, 16, 20),
                    child: Container(
                      height: 380, 
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                          image: NetworkImage(widget.place.image),
                          fit: BoxFit.cover,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // Back Button
                Positioned(
                  top: 65,
                  left: 30,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: CircleAvatar(
                      backgroundColor: Colors.white.withOpacity(0.9),
                      child: const Icon(Icons.arrow_back, color: Colors.black),
                    ),
                  ),
                ),
                // Favorite Button
                Positioned(
                  top: 65,
                  right: 30,
                  child: CircleAvatar(
                    backgroundColor: Colors.white.withOpacity(0.9),
                    child: IconButton(
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.red : Colors.black,
                      ),
                      onPressed: _handleFavoriteToggle,
                    ),
                  ),
                ),
              ],
            ),

            // Details Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.place.title,
                    style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(Icons.location_on, color: Colors.blue, size: 18),
                      const SizedBox(width: 4),
                      Text(
                        widget.place.location,
                        style: const TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                      const Spacer(),
                      const Icon(Icons.star, color: Colors.orange, size: 18),
                      Text(
                        ' ${widget.place.rating}',
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  // Facilities Section
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FacilityChip(icon: Icons.wifi, label: "Wifi"),
                      FacilityChip(icon: Icons.restaurant, label: "Food"),
                      FacilityChip(icon: Icons.map, label: "Guide"),
                    ],
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'About Destination',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    widget.place.description,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 15,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}