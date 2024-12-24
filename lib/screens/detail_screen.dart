import 'package:flutter/material.dart';
import 'package:sevillage_explorer/screens/favorite_screen.dart'; // Import FavoriteScreen

class DetailScreen extends StatefulWidget {
  final String title;
  final String category;
  final String image;
  final double rating;
  final double price;

  const DetailScreen({
    Key? key,
    required this.title,
    required this.category,
    required this.image,
    required this.rating,
    required this.price,
  }) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool isFavorite = false; // Track if the item is marked as favorite

  // Method to toggle the favorite status
  void _toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.white,
            ),
            onPressed: _toggleFavorite,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            Center(
              child: Image.asset(
                widget.image,
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),
            // Title
            Text(
              widget.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            // Category
            Text(
              widget.category,
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(height: 8),
            // Rating
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber),
                SizedBox(width: 4),
                Text(widget.rating.toString(), style: TextStyle(fontSize: 16)),
              ],
            ),
            SizedBox(height: 16),
            // Price
            Text(
              'Rp ${widget.price.toString()}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 16),                        
            SizedBox(height: 16),            
          ],
        ),
      ),
    );
  }
}
