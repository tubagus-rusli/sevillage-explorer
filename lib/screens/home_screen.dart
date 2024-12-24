import 'package:flutter/material.dart';
import 'package:sevillage_explorer/screens/detail_screen.dart'; // Import DetailScreen

class HomeScreen extends StatelessWidget {

  final List<Map<String, dynamic>> popular = [
    {
      'title': 'Sepeda Terbang',
      'category' : 'Spot Foto & Wahana',
      'rating': 4.5,
      'image': 'assets/sepeda.jpeg',
    },
    {
      'title': 'Ayam Geprek',
      'category' : 'Makanan Berat',
      'rating': 4.7,
      'image': 'assets/ayam_geprek.jpg',
    },
    {
      'title': 'Ayunan',
      'category': 'Spot Foto & Wahana',
      'rating': 4.5,      
      'image': 'assets/ayunan.jpeg',
    },
  ];

  final List<Map<String, dynamic>> recommendedDestinations = [
    {
      'title': 'Sepeda Terbang',
      'category': 'Spot Foto & Wahana Bermain',
      'rating': 4.6,
      'price': 30000,
      'image': 'assets/sepeda.jpeg',
    },
    {
      'title': 'Rice Bowl Chicken Katsu',
      'category': 'Makanan Berat',
      'rating': 4.6,
      'price': 30000,
      'image': 'assets/rice_bowl.jpg',
    },
    {
      'title': 'Ayunan',
      'category': 'Spot Foto & Wahana Bermain',
      'rating': 4.5,
      'price': 25000,
      'image': 'assets/ayunan.jpeg',
    },
    {
      'title': 'Croissant',
      'category': 'Dessert',
      'rating': 4.6,
      'price': 35000,
      'image': 'assets/croissant.jpg',
    },    
    {
      'title': 'Foto Cantik',
      'category': 'Spot Foto',
      'rating': 4.8,
      'price': 15000,
      'image': 'assets/foto_cantik.jpeg',
    },
    {
      'title': 'Camping Ground',
      'category': 'Wahana Keluarga',
      'rating': 4.7,
      'price': 200000,
      'image': 'assets/camping_ground.jpeg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      body: ListView(
        children: [
          // Section 1: Popular Destinations
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Populer',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),                
              ],
            ),
          ),
          SizedBox(
            height: 180,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: popular.length,
              itemBuilder: (context, index) {
                final destination = popular[index];
                return GestureDetector(
                  onTap: () {
                    // Navigasi ke DetailScreen saat item dipilih
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(
                          title: destination['title'],
                          category: destination['category'],
                          image: destination['image'],
                          rating: destination['rating'],
                          price: 0, // Jika tidak ada harga, bisa diatur 0 atau sesuaikan
                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: 150,
                    margin: const EdgeInsets.only(left: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            destination['image'],
                            width: 150,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          destination['title'],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(destination['category']),
                        Row(
                          children: [
                            const Icon(Icons.star, size: 14, color: Colors.amber),
                            const SizedBox(width: 4),
                            Text(destination['rating'].toString()),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // Section 2: Recommended for You
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Rekomendasi Untuk Kamu',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),                
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: recommendedDestinations.length,
            itemBuilder: (context, index) {              
              final destination = recommendedDestinations[index];              
              return GestureDetector(
                onTap: () {
                  // Navigasi ke DetailScreen saat item dipilih
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
                child: Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(                                  
                    leading: Image.asset(
                      destination['image'],
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
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
                            const Icon(Icons.star, size: 16, color: Colors.amber),
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
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
