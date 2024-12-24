import 'package:flutter/material.dart';

class SevillageScreen extends StatelessWidget {
  const SevillageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Image
            Image.asset(
              'assets/sevillage.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200,
            ),
            const SizedBox(height: 16),

            // Section Title
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: const Text(
                'Sejarah Wisata Alam Sevillage',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),

            // Historical Overview
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: const Text(
                'Terletak di kaki Gunung Gede Pangrango, Sevillage Puncak, '
                'Cianjur adalah destinasi wisata alam yang menarik perhatian pengunjung '
                'sejak dibuka. Awalnya, kawasan ini dirancang sebagai tempat glamping dengan konsep ramah lingkungan. '
                'Seiring waktu, lokasi ini berkembang menjadi destinasi yang menawarkan berbagai wahana seru, '
                'tempat berkemah, dan spot foto Instagramable. Keindahan alamnya '
                'menciptakan suasana yang menenangkan sekaligus menyegarkan.',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 16),

            // Spot Photo Section
            _buildSectionTitle('Spot Foto Instagramable'),
            _buildImageCard(
              'assets/foto_cantik.jpeg',
              'Sevillage menawarkan beragam spot foto menarik seperti Helikopter, Sky Tree, '
              'dan Adrenaline Wing yang memacu adrenalin. Keindahan panorama pegunungan '
              'membuatnya cocok untuk sesi foto yang menawan.',
            ),

            // Glamping Section
            _buildSectionTitle('Glamping dan Camping'),
            _buildImageCard(
              'assets/camping_ground.jpeg',
              'Pengunjung dapat menikmati pengalaman menginap di glamping mewah atau berkemah '
              'dengan fasilitas lengkap, seperti tenda keong dan suite deluxe. Lokasi ini juga menawarkan '
              'sarapan, pemandangan matahari terbit, serta suasana malam yang nyaman.',
            ),

            // Adventure Section
            _buildSectionTitle('Wahana dan Petualangan'),
            _buildImageCard(
              'assets/ayunan.jpeg',
              'Berbagai wahana seperti Sky Bike, Flying Fox, dan Sky Swing memungkinkan pengunjung '
              'merasakan sensasi bermain di ketinggian sambil menikmati keindahan alam sekitarnya.',
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  // Reusable Widget for Section Titles
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  // Reusable Widget for Image with Description
  Widget _buildImageCard(String imagePath, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Card(
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imagePath, fit: BoxFit.cover, width: double.infinity),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                description,
                textAlign: TextAlign.justify,
                style: const TextStyle(fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
