import 'package:flutter/material.dart';
import 'package:sevillage_explorer/screens/home_screen.dart';
import 'package:sevillage_explorer/screens/destination_screen.dart';
import 'package:sevillage_explorer/screens/culinary_screen.dart';
import 'package:sevillage_explorer/screens/sevillage_screen.dart';
import 'package:sevillage_explorer/screens/splashScreen.dart';
import 'package:sevillage_explorer/screens/mode_screen.dart';
import 'package:sevillage_explorer/screens/bahasa_screen.dart';
import 'package:sevillage_explorer/screens/favorite_screen.dart'; // Import FavoriteScreen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedNavbar = 0;
  bool isDarkMode = false; 
  String language = 'English';

  void _changeSelectedNavBar(int index) {
    setState(() {
      _selectedNavbar = index;
    });
  }

  void _showPopupMenu(BuildContext context) async {
    final result = await showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(10, 60, 30, 0), 
      items: [
        PopupMenuItem<String>(
          value: 'bahasa',
          child: ListTile(
            leading: Icon(Icons.language),
            title: Text('Bahasa'),
          ),
        ),
        PopupMenuItem<String>(
          value: 'mode',
          child: ListTile(
            leading: Icon(Icons.dark_mode),
            title: Text('Mode'),
          ),
        ),
      ],
    );
    
    if (result == 'bahasa') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BahasaScreen()),
      );
    } else if (result == 'mode') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ModeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(244, 121, 189, 216),
        leading: IconButton(
          onPressed: () {
            _showPopupMenu(context); 
          },
          icon: Icon(Icons.list_rounded, size: 30),
        ),
        title: Text(
          'Sevillage Explorer',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              // Navigasi ke FavoriteScreen ketika ikon favorit ditekan
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FavoriteScreen()),
              );
            },
            icon: Icon(Icons.local_play, size: 30), // Ikon favorit
          ),
        ],
      ),
      body: _getBody(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Color.fromARGB(244, 121, 189, 216),
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.whatshot),
            label: 'Destination',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood),
            label: 'Culinary',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history_edu),
            label: 'Sevillage',
          ),
        ],
        currentIndex: _selectedNavbar,
        selectedItemColor: const Color.fromARGB(255, 255, 255, 255),
        unselectedItemColor: Color.fromARGB(244, 95, 95, 95),
        showUnselectedLabels: true,
        onTap: _changeSelectedNavBar,
      ),
    );
  }

  Widget _getBody() {
    switch (_selectedNavbar) {
      case 0:
        return HomeScreen();
      case 1:
        return destination_screen();
      case 2:
        return culinary_screen();
      case 3:
        return const SevillageScreen();
      default:
        return Center(
          child: Text(
            "Tab belum diimplementasikan!",
            style: TextStyle(fontSize: 16),
          ),
        );
    }
  }
}
