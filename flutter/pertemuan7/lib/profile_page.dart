import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Profil"),
        backgroundColor: Colors.blue,
      ),

      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage("assets/images/avatar.jpg"),
            ),

            SizedBox(height: 15),

            Text("Elok Alya Ajeng",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text("Politeknik Negeri Malang"),

            SizedBox(height: 20),

            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  infoRow("NIM", "123456789"),
                  infoRow("Program Studi", "D4 Teknik Informatika"),
                  infoRow("Semester", "5"),
                ],
              ),
            ),

            Spacer(),

            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Kembali"),
            )
          ],
        ),
      ),
    );
  }

  Row infoRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("$title:", style: TextStyle(fontWeight: FontWeight.bold)),
        Text(value)
      ],
    );
  }
}
