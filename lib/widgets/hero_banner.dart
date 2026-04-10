import 'package:flutter/material.dart';

class HeroBanner extends StatelessWidget {
  const HeroBanner({super.key});

  @override
  Widget build(BuildContext context) {
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
        child: Container( // container ekaka background ekata image eka demma eke text tika show wenne image ek matha.. 
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
           
              Container( // container ekk kiyanne multi purpose widget ekka. widget ekk box ekk wge fram ekakat dala style krnn mek use krnn puluwn
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

}