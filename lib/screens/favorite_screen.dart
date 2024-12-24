import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Map<String, dynamic>> favoriteItems = [
    // Contoh data favorit, Anda dapat menambahkan atau mengambilnya sesuai dengan aplikasi Anda
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
    // Tambahkan data favorit lainnya
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
        backgroundColor: Color.fromARGB(244, 121, 189, 216),
      ),
      body: ListView.builder(
        itemCount: favoriteItems.length,
        itemBuilder: (context, index) {
          final item = favoriteItems[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: ListTile(
              leading: Image.asset(
                item['image'],
                width: 70,
                height: 70,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Icon(
                  Icons.image_not_supported,
                  size: 50,
                ),
              ),
              title: Text(
                item['title'],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(item['category']),
              trailing: Text(
                'Rp. ${item['price']}',
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
