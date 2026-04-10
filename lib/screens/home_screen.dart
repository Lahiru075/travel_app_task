import 'package:flutter/material.dart';
import 'package:travel_app_task/models/place_model.dart';
import '../widgets/place_card.dart';
import '../widgets/hero_banner.dart';
import '../widgets/place_card.dart';
import 'details_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Map<String, String>> places = [
    {
      'name': 'Sigiriya Rock',
      'image': 'assets/images/place1.jpg',
      'location': 'Dambulla, Sri Lanka',
      'rating': '4.9',
      'description':
          'Sigiriya or Sinhagiri is an ancient rock fortress located in the northern Matale District. It is a UNESCO World Heritage site and famous for its frescoes and lion-shaped entrance.',
    },
    {
      'name': 'Nine Arch Bridge',
      'image': 'assets/images/place2.jpg',
      'location': 'Ella, Sri Lanka',
      'rating': '4.8',
      'description':
          'The Nine Arch Bridge in Ella is one of the best examples of colonial-era railway construction in Sri Lanka. It is world-famous for its beautiful setting in the lush green tea plantations.',
    },
    {
      'name': 'Galle Fort',
      'image': 'assets/images/place3.jpg',
      'location': 'Galle, Sri Lanka',
      'rating': '4.7',
      'description':
          'Galle Fort is a historical, archaeological and architectural heritage monument. It was built first in 1588 by the Portuguese, then extensively fortified by the Dutch during the 17th century.',
    },
    {
      'name': 'Mirissa Beach',
      'image': 'assets/images/place4.jpg',
      'location': 'Matara, Sri Lanka',
      'rating': '4.8',
      'description':
          'Mirissa is a popular tourist destination on the south coast of Sri Lanka. It is famous for its beautiful sandy beach, nightlife, and as one of the best whale watching spots in the world.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0, // Remove shadow
        title: const Column( // title use krnne topics wage dewl danna
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
        actions: [ // actions eken thami appbar eke right side eke dewal define krnne
          Padding( // meka layout widget ekka.. mek use krnne child widget walata internal space add kranna
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
        shrinkWrap: true, // items walata adal ida witrak gannwa.. full screen ekm ganne nehe
        physics: const NeverScrollableScrollPhysics(), // full page ekam scroll karanawa
        itemCount: places.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount( // ek row ekakta koccara tiyenn onid kiyl decide kranawa
          crossAxisCount: 2, 
          crossAxisSpacing: 15, // cards athara horizontal space 
          mainAxisSpacing: 15, // cards athara vertical space
          childAspectRatio: 0.8, // card layout (width ekta wda height ek wedi)
        ),
        itemBuilder: (context, index) {
          final placeData = Place(
            name: places[index]['name']!,
            image: places[index]['image']!,
            location: places[index]['location']!,
            rating: places[index]['rating']!,
            description: places[index]['description']!,
          );

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(place: placeData),
                ),
              );
            },
            child: PlaceCard(
              name: placeData.name,
              image: placeData.image,
              location: placeData.location,
              rating: placeData.rating,
            ),
          );
  
        },
      ),
    );
  }
}
