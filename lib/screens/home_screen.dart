import 'package:flutter/material.dart';

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
            _buildHeroBanner(),

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

  Widget _buildHeroBanner() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
      child: Container(
        height: 220,
        width: double.infinity,
        decoration: BoxDecoration( // mekak athule image ekak demmama image ek background ekat yanawa.. ek nisa tamai text tika image ek matha pennanne
          borderRadius: BorderRadius.circular(25),
          image: const DecorationImage(
            image: AssetImage('assets/images/banner.jpg'),
            fit: BoxFit.cover,
          ),
          boxShadow:[
            BoxShadow(color: Colors.black.withOpacity(0.15), blurRadius: 15, offset: const Offset(0, 8)),
          ],
        ),
        child: Container( // container ekaka background ekata image eka demma eke text tika show wenne image ek matha
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors:[
                Colors.black.withOpacity(0.7),
                Colors.black.withOpacity(0.1),
              ],
            ),
          ),
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
           
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2), 
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white.withOpacity(0.5), width: 1),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children:[
                    Icon(Icons.auto_awesome, color: Colors.amberAccent, size: 14),
                    SizedBox(width: 5),
                    Text('Top Pick', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              
              const Spacer(), 
              
              const Text(
                'Explore the Beauty\nof Sri Lanka',
                style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold, height: 1.2),
              ),
              const SizedBox(height: 8),
              const Text(
                'Find the best places to visit for your next vacation.',
                style: TextStyle(color: Colors.white70, fontSize: 13),
              ),
            ],
          ),
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
          return _buildGridCard(
            place['name']!,
            place['image']!,
            place['location']!,
            place['rating']!,
          );
        },
      ),
    );
  }

  Widget _buildGridCard(String name, String image, String location, String rating) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow:[
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 5)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
  
          Stack( // meka use kale card eke image ekta udin rating eka show krnna
            children:[
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                child: Image.asset(image, height: 110, width: double.infinity, fit: BoxFit.cover), 
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children:[
                      const Icon(Icons.star, color: Colors.orange, size: 12),
                      const SizedBox(width: 2),
                      Text(rating, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Text(name, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold), maxLines: 1, overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 4),
                  Row(
                    children:[
                      Icon(Icons.location_on, size: 12, color: Colors.blue[400]),
                      const SizedBox(width: 3),
                      Expanded( // name eka hri location ek hri godak diga unoth agata thith 3k dala pennanawa lassanata
                        child: Text(location, style: const TextStyle(fontSize: 11, color: Colors.grey), maxLines: 1, overflow: TextOverflow.ellipsis),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}
