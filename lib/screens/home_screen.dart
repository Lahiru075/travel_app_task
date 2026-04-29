import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import '../providers/place_provider.dart';
import '../widgets/place_card.dart';
import '../widgets/hero_banner.dart';
import 'details_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final placesAsync = ref.watch(placesProvider); // provider eken data gannwa 

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
      body: placesAsync.when(
        data: (places) => RefreshIndicator(
          onRefresh: () => ref.refresh(placesProvider.future),
          child: SingleChildScrollView(
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
                        'Top Destinations',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'See All',
                        style: TextStyle(fontSize: 14, color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                _buildGridPlaces(places),
                const SizedBox(height: 20), 
              ],
            ),
          ),
        ),
        loading: () => _buldShimmerLoading(),
        error: (error, stack) => Center(
          child: Text('Error: $error'),
        ),
      ),
    );
  }


  Widget _buildGridPlaces(List places) {
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
          final place = places[index];

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(place: place),
                ),
              );
            },
            child: PlaceCard(
              title: place.title,
              image: place.image,
              location: place.location,
              rating: place.rating,
            ),
          );
  
        },
      ),
    );
  }

  Widget _buldShimmerLoading() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(height: 200, width: double.infinity, color: Colors.white, margin: const EdgeInsets.all(16)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: 4,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (context, index) => Container(
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
