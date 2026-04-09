import 'package:flutter/material.dart';
import '../widgets/place_card.dart';
import '../widgets/hero_banner.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Map<String, String>> places = [
    {
      'name': 'Sigiriya Rock',
      'image': 'assets/images/place1.jpg',
      'location': 'Dambulla, Sri Lanka',
      'rating': '4.9',
    },
    {
      'name': 'Nine Arch Bridge',
      'image': 'assets/images/place2.jpg',
      'location': 'Ella, Sri Lanka',
      'rating': '4.8',
    },
    {
      'name': 'Galle Fort',
      'image': 'assets/images/place3.jpg',
      'location': 'Galle, Sri Lanka',
      'rating': '4.7',
    },
    {
      'name': 'Mirissa Beach',
      'image': 'assets/images/place4.jpg',
      'location': 'Matara, Sri Lanka',
      'rating': '4.8',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0, // Remove shadow
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ready to explore 🌍',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            Text(
              'Traveler',
              style: TextStyle(fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0), // add pixel 16 padding to the right
            child: CircleAvatar(
              backgroundColor: Colors.blue[100],
              child: const Icon(
                Icons.person,
                color: Colors.blue,
              ),
            ),
          )
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeroBanner(),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular Destinations',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'See All',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            _buildGridPlaces(), 
            const SizedBox(height: 20),

          ],
        ),
      ),
    );
  }


  Widget _buildGridPlaces() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GridView.builder( // GridView.builder eka use kale. peliyakata deka gane show krnna
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: places.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, 
          crossAxisSpacing: 15, 
          mainAxisSpacing: 15, 
          childAspectRatio: 0.8, 
        ),
        itemBuilder: (context, index) {
          final place = places[index];

          return PlaceCard( 
            name: place['name'] ?? '',
            image: place['image'] ?? '',
            location: place['location'] ?? '',
            rating: place['rating'] ?? '',
          );
  
        },
      ),
    );
  }
}
