import 'package:flutter/material.dart';

class ModeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Mode',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          _buildButton(context, 'Gelap'),
          SizedBox(height: 10),
          _buildButton(context, 'Terang'),
          Spacer(),
          _buildFooter(),
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFD6EAF8),
          minimumSize: Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          // Logika untuk mengganti mode aplikasi
        },
        child: Text(
          text,
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Column(
      children: [
        Image.asset('assets/sevillage.png', height: 60), // Ganti dengan logo Anda
        SizedBox(height: 10),
        Text('Desain by : Kelompok 3', style: TextStyle(color: Colors.black54)),
        SizedBox(height: 20),
      ],
    );
  }
}
