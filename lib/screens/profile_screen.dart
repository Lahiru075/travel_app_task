import 'package:flutter/material.dart';
import '../widgets/profile_tile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),

            Center(
              child: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    child: CircleAvatar(
                      radius: 55,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 52,
                        backgroundImage: AssetImage('assets/images/profile.jpg'),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom:0,
                    right: 4,
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 14,
                        backgroundColor: Colors.blue,
                        child: const Icon(Icons.camera_alt, size: 14, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 15),

            const Text(
              'Lahiru Lakshan',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Pro Traveler 🌍',
              style: TextStyle(fontSize: 14, color: Colors.blue, fontWeight: FontWeight.w500),
            ),

            const SizedBox(height: 25),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.02),
                      blurRadius: 10
                    )
                  ]
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildStatItem("Trips", "24"),
                    _buildStatItem("Reviews", "12"),
                    _buildStatItem("Points", "850"),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Account Settings", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black54)),
                  const SizedBox(height: 10),
                  ProfileTile(icon: Icons.person_outline, title: "Edit Profile", color: Colors.blue, isLogout: false),
                  ProfileTile(icon: Icons.history, title: "Travel History", color: Colors.orange, isLogout: false),
                  ProfileTile(icon: Icons.notifications, title: "Notifications", color: Colors.purple, isLogout: false),

                  const SizedBox(height: 25),
                  const Text("Support & Others", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black54)),
                  const SizedBox(height: 10),
                  ProfileTile(icon: Icons.help_outline, title: "Help Center", color: Colors.green, isLogout: false),
                  ProfileTile(icon: Icons.logout, title: "Logout", color: Colors.red, isLogout: true),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String value){
    return Column(
      children: [
        Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }
}
