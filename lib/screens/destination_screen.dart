import 'package:flutter/material.dart';
import 'detail_screen.dart';  // Pastikan DetailScreen sudah ada

class destination_screen extends StatefulWidget {
  const destination_screen({super.key});

  @override
  _DestinationScreenState createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<destination_screen> {
  final List<Map<String, dynamic>> destinations = [
    {
      'title': 'Flying Fox',
      'category': 'Wahana Ekstrim',
      'rating': 4.8,
      'price': 40000,
      'image': 'assets/flying_fox.jpeg',
    },
    {
      'title': 'Sepeda Terbang',
      'category': 'Spot Foto & Wahana Bermain',
      'rating': 4.5,
      'price': 30000,
      'image': 'assets/sepeda.jpeg',
    },
    {
      'title': 'Camping Ground',
      'category': 'Wahana Keluarga',
      'rating': 4.7,
      'price': 200000,
      'image': 'assets/camping_ground.jpeg',
    },
    {
      'title': 'Ayunan',
      'category': 'Spot Foto & Wahana Bermain',
      'rating': 4.5,
      'price': 25000,
      'image': 'assets/ayunan.jpeg',
    },
    {
      'title': 'Foto Cantik',
      'category': 'Spot Foto',
      'rating': 4.8,
      'price': 15000,
      'image': 'assets/foto_cantik.jpeg',
    },
  ];

  List<Map<String, dynamic>> filteredDestinations = [];
  String searchQuery = "";

  @override
  void initState() {
    super.initState();
    // Initialize the filtered list with all destinations
    filteredDestinations = destinations;
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
                hintText: 'Search destinations...',
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
                      errorBuilder: (context, error, stackTrace) => Icon(
                        Icons.image_not_supported,
                        size: 50,
                      ),
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
                      'Rp. ${destination['price'].toString()}',
                      style: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      // Navigate to DetailScreen and pass the selected destination details
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(
                            title: destination['title'],
                            category: destination['category'],
                            image: destination['image'],
                            rating: destination['rating'],
                            price: destination['price'],
                          ),
                        ),
                      );
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
