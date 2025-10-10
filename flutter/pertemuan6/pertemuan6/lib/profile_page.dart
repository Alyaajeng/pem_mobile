import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Mahasiswa'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        color: Colors.teal.shade50,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FlutterLogo(size: 80),
            const SizedBox(height: 16),
            CircleAvatar(
              radius: 50,
              backgroundImage: const AssetImage('assets/profile.jpg'),
              onBackgroundImageError: (e, s) => const Placeholder(),
            ),
            const SizedBox(height: 16),
            Text(
              'Elok Setyaningrum',
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'NIM: 2241720003',
              style: GoogleFonts.poppins(fontSize: 16),
            ),
            Text(
              'Jurusan Teknologi Informasi',
              style: GoogleFonts.poppins(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.email, color: Colors.blue),
                SizedBox(width: 8),
                Icon(Icons.phone, color: Colors.green),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
