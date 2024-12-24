import 'package:flutter/material.dart';
import 'detail_screen.dart'; // Pastikan import DetailScreen

class culinary_screen extends StatefulWidget {
  const culinary_screen({super.key});

  @override
  _CulinaryScreenState createState() => _CulinaryScreenState();
}

class _CulinaryScreenState extends State<culinary_screen> {
  final List<Map<String, dynamic>> destinations = [
    {
      'title': 'Ayam Geprek',
      'category': 'Makanan Berat',
      'rating': 4.6,
      'price': 35000,
      'image': 'assets/ayam_geprek.jpg',
    },
    {
      'title': 'Croissant',
      'category': 'Dessert',
      'rating': 4.6,
      'price': 35000,
      'image': 'assets/croissant.jpg',
    },
    {
      'title': 'Rice Bowl Chicken Katsu',
      'category': 'Makanan Berat',
      'rating': 4.6,
      'price': 30000,
      'image': 'assets/rice_bowl.jpg',
    },
    {
      'title': 'Roti Bakar',
      'category': 'Dessert',
      'rating': 4.6,
      'price': 35000,
      'image': 'assets/roti_bakar.jpg',
    },
    {
      'title': 'Spageti',
      'category': 'Dessert',
      'rating': 4.8,
      'price': 25000,
      'image': 'assets/spageti.jpeg',
    },
  ];

  List<Map<String, dynamic>> filteredDestinations = [];
  String searchQuery = "";

  @override
  void initState() {
    super.initState();
    filteredDestinations = destinations; // Inisialisasi list yang difilter
  }

  void updateSearchQuery(String query) {
    setState(() {
      searchQuery = query.toLowerCase();
      filteredDestinations = destinations.where((destination) {
        final title = destination['title'].toLowerCase();
        final category = destination['category'].toLowerCase();
        return title.contains(searchQuery) || category.contains(searchQuery);
      }).toList();
    });
  }

  void _navigateToDetailScreen(Map<String, dynamic> culinary) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailScreen(
          title: culinary['title'],
          category: culinary['category'],
          image: culinary['image'],
          rating: culinary['rating'],
          price: culinary['price'],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: updateSearchQuery,
              decoration: InputDecoration(
                hintText: 'Search culinary...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          // List of destinations
          Expanded(
            child: ListView.builder(
              itemCount: filteredDestinations.length,
              itemBuilder: (context, index) {
                final destination = filteredDestinations[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: ListTile(
                    leading: Image.asset(
                      destination['image'],
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.image_not_supported, size: 50),
                    ),
                    title: Text(
                      destination['title'],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(destination['category']),
                        Row(
                          children: [
                            const Icon(Icons.star, color: Colors.amber, size: 16),
                            const SizedBox(width: 4),
                            Text(destination['rating'].toString()),
                          ],
                        ),
                      ],
                    ),
                    trailing: Text(
                      'Rp ${destination['price'].toString()}',
                      style: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      // Navigasi ke DetailScreen
                      _navigateToDetailScreen(destination);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
