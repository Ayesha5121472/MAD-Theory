import 'package:flutter/material.dart';
import 'details_screen.dart';

class CatalogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        leading: Icon(Icons.menu, color: Colors.black),
        actions: [
          Icon(Icons.shopping_cart, color: Colors.black),
          SizedBox(width: 20),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "What Kind\nOf Plants You Want",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                suffixIcon: Icon(Icons.mic, color: Colors.grey),
                hintText: "Search...",
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildCategory("All", true),
                _buildCategory("Small", false),
                _buildCategory("Medium", false),
                _buildCategory("Hanging", false),
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 items per row
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.8, // Normal aspect ratio
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PlantDetailsScreen()),
                      );
                    },
                    child: _buildPlantCard(
                      ["Ficas", "Cactus", "Samantha", "Aloe Vera"][index],
                      "From \$12",
                      ["Images/plant1.jpg", "Images/plant 2.jpg", "Images/plant3.jpg", "Images/plant4.jpg"][index],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategory(String title, bool isSelected) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: isSelected ? Colors.green : Colors.black,
      ),
    );
  }

  Widget _buildPlantCard(String name, String price, String imagePath) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Icon(Icons.favorite_border, color: Colors.white),
          ),
          Center(
            child: Image.asset(imagePath, height: 100), // Adjusted image height
          ),
          SizedBox(height: 10),
          Text("Indoor", style: TextStyle(color: Colors.white70, fontSize: 12)),
          Text(name, style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          Text(price, style: TextStyle(color: Colors.white70, fontSize: 14)),
          Spacer(),
          Align(alignment: Alignment.bottomRight, child: Icon(Icons.add, color: Colors.white)),
        ],
      ),
    );
  }
}
