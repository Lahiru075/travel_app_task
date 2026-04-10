import 'package:flutter/material.dart';
import '../widgets/facility_chip.dart';
import '../models/place_model.dart';

class DetailsScreen extends StatefulWidget {
  final Place place;

  const DetailsScreen({super.key, required this.place});

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
              // meka overlay widget ekak.. meken puluwn widget ekak uda ekak thiyanna
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 50, 16, 20),
                  child: Container(
                    height: 350,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                        image: AssetImage(widget.place.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

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
                  Text(
                    widget.place.name,
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Colors.blue,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        widget.place.location,
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      const Spacer(),
                      const Icon(Icons.star, color: Colors.orange, size: 16),
                      Text(
                        ' ${widget.place.rating}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  Row(
                    children: [
                      FacilityChip(icon: Icons.wifi, label: "wifi"),
                      const SizedBox(width: 12),
                      FacilityChip(icon: Icons.restaurant, label: "Food"),
                      const SizedBox(width: 12),
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
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 15,
                      height: 1.6,
                    ),
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
}
