import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<String> mataKuliah = [
    "Pemrograman Mobile",
    "Machine Learning",
    "Cloud Computing",
    "UI/UX Design",
    "Data Warehouse",
    "Sistem Terdistribusi",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profil Mahasiswa"),
        backgroundColor: Colors.blue,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profile Row
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage("assets/images/avatar.jpg"),
                ),
                SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Elok Alya Ajeng",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    Text("D4 Teknik Informatika"),
                  ],
                )
              ],
            ),

            SizedBox(height: 20),

            // Title ListView
            Text(
              "Mata Kuliah Semester 5",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),

            // ListView (inside Expanded)
            Expanded(
              child: ListView.builder(
                itemCount: mataKuliah.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(12),
                    margin: EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(mataKuliah[index]),
                  );
                },
              ),
            ),

            SizedBox(height: 10),

            // Button to Gallery Page
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/gallery'),
              child: Text("Buka Galeri"),
            ),

            // Button to Detail Profile Page
            TextButton(
              onPressed: () => Navigator.pushNamed(context, '/profile'),
              child: Text("Lihat Detail Profil"),
            )
          ],
        ),
      ),
    );
  }
}
