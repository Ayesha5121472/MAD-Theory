import 'package:flutter/material.dart';

class PlantDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        centerTitle: true,
        title: Text("Details", style: TextStyle(color: Colors.black)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Icon(Icons.favorite_border, color: Colors.black),
          SizedBox(width: 20),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("Images/plant3.jpg", height: 350),
            SizedBox(height: 20),
            Text("Samantha Tree", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            Text("Regular Price \$195.00", style: TextStyle(fontSize: 16, color: Colors.grey)),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
              child: Text("Buy Now", style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
