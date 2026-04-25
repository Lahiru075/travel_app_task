import 'package:flutter/material.dart';

class PlaceCard extends StatelessWidget{
  
  final String name;
  final String image;
  final String location;
  final String rating;

  const PlaceCard({
    super.key,
    required this.name,
    required this.image,
    required this.location,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
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
              ClipRRect( // mek use kranne image eke corners rounded krnna
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