import 'package:flutter/material.dart';

class ProfileTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;
  final bool isLogout;

  const ProfileTile({
    super.key,
    required this.icon,
    required this.title,
    required this.color,
    this.isLogout = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 5
          ),
        ]
      ),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)), // click karaddi ena issue eka fix kala
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10)
          ),
          child: Icon(
            icon, color: color, size: 20,
          ),
        ),
        title: Text(title, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: isLogout ? Colors.red : Colors.black87)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.black26),
        onTap: () {},
      ),
    );
  }
}