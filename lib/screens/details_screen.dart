import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();

}

class _DetailsScreenState extends State<DetailsScreen> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 50, 16, 20),
                  child: Container(
                    height: 350,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/place1.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  top: 65, left: 30,
                  child: CircleAvatar(
                    backgroundColor: Colors.white.withOpacity(0.9),
                    child: const Icon(Icons.arrow_back, color: Colors.black),
                  ),
                ),

                Positioned(
                  top: 65, right: 30,
                  child: CircleAvatar(
                    backgroundColor: Colors.white.withOpacity(0.9),
                    child: IconButton(
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.red : Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Sigiriya Rock Fortress',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(Icons.location_on, color: Colors.blue, size: 16),
                      const SizedBox(width: 4),
                      const Text('Dambulla, Sri Lanka', style: TextStyle(color: Colors.grey, fontSize: 14)),
                      const Spacer(),
                      const Icon(Icons.star, color: Colors.orange, size: 16),
                      const Text(' 4.9', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    ],
                  ),

                  const SizedBox(height: 25),

                  Row(
                    children: [
                      _buildChip(Icons.wifi, "wifi"),
                      const SizedBox(width: 12),
                      _buildChip(Icons.restaurant, "Food"),
                      const SizedBox(width: 12),
                      _buildChip(Icons.map, "Guide"),
                    ],
                  ),

                  const SizedBox(height: 30),

                  const Text(
                    'About Destination',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Sigiriya is an ancient rock fortress located in the northern Matale District near the town of Dambulla in the Central Province, Sri Lanka. It is a site of historical and archaeological significance.',
                    style: TextStyle(color: Colors.black54, fontSize: 15, height: 1.6),
                  ),
                  const SizedBox(height: 30),
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChip(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.05),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.blue.withOpacity(0.1)),
      ),
      child: Row(
        children: [
          Icon(icon, size: 16, color: Colors.blue),
          const SizedBox(width: 6),
          Text(
            label, 
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black87),
          )
        ],
      ),
    );
  }

}