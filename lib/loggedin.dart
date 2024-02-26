import 'package:cat_tinder/add_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:get/get.dart';
import '../controllers/animal_controller.dart';

class LoggedInScreen extends StatefulWidget {
  const LoggedInScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoggedInScreenState createState() => _LoggedInScreenState();
}

class _LoggedInScreenState extends State<LoggedInScreen> {
  // Index for the current selected tab
  int _selectedIndex = 0;

  // Assuming AnimalController is already registered with GetX
  final AnimalController controller = Get.find<AnimalController>();

  // List of widgets to display for each tab
  List<Widget> _widgetOptions() => [
        Obx(() => Swiper(
              itemBuilder: (BuildContext context, int index) {
                return Image.network(
                  controller.allAnimalImages[index],
                  fit: BoxFit.cover,
                );
              },
              itemCount: controller.allAnimalImages.length,
              pagination: const SwiperPagination(),
              control: const SwiperControl(),
            )),
        const Center(
            child: Text('Another Tab Content')), // Placeholder for other tabs
      ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  int _navigationIndex = 0;

  void _onNavigationTapped(int index) {
    switch (index) {
      case 0:
        if (_navigationIndex == 0) {
          break;
        }
        const LoggedInScreen();
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LoggedInScreen()));
        _navigationIndex = index;
      case 1:
        if (_navigationIndex == 1) {
          break;
        }
        const LoggedInScreen();
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LoggedInScreen()));
        _navigationIndex = index;
      case 2:
        if (_navigationIndex == 2) {
          break;
        }
        const AdminPanelScreen();
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const AdminPanelScreen()));
        _navigationIndex = index;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Swipe Through Animals'),
        centerTitle: true,
      ),
      body: Center(
        child: _widgetOptions().elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.heart), label: 'Likes'),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _navigationIndex,
        onTap: _onNavigationTapped,
      ),
    );
  }
}
