import 'package:cat_tinder/add_screen.dart';
import 'package:cat_tinder/messages.dart';
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

class _LoggedInScreenState extends State<LoggedInScreen>
    with SingleTickerProviderStateMixin {
  final SwiperController swiperController =
      SwiperController(); // Correct declaration
  // Index for the current selected tab
  int _selectedIndex = 0;

  // Assuming AnimalController is already registered with GetX
  final AnimalController controller = Get.find<AnimalController>();

  List<Widget> _widgetOptions() => [
        Obx(() => Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Swiper(
                  controller: swiperController, // Correct usage
                  itemBuilder: (BuildContext context, int index) {
                    return Image.network(
                      controller.allAnimalImages[index],
                      fit: BoxFit.cover,
                    );
                  },
                  itemCount: controller.allAnimalImages.length,
                  layout: SwiperLayout.STACK,
                  itemWidth: MediaQuery.of(context).size.width * 0.8,
                  itemHeight: MediaQuery.of(context).size.height * 0.6,
                  pagination: null,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FloatingActionButton(
                      backgroundColor: Colors.white,
                      child: const Icon(Icons.close, size: 36),
                      onPressed: () {
                        swiperController.next(); // Correct usage
                      },
                    ),
                    FloatingActionButton(
                      backgroundColor: Colors.white,
                      child: const Icon(Icons.check_circle, size: 36),
                      onPressed: () {
                        swiperController.next(); // Correct usage
                      },
                    ),
                  ],
                ),
              ],
            )),
        const Center(child: Text('Another Tab Content')),
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
        title: const Text('purrfect match!'),
        centerTitle: true,
      ),
      body: Center(
        child: _widgetOptions().elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'home',
          ),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.heart), label: 'likes'),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),
            label: 'admin',
          ),
        ],
        currentIndex: _navigationIndex,
        onTap: _onNavigationTapped,
      ),
    );
  }
}
