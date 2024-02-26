import 'package:cat_tinder/add_screen.dart';
import 'package:cat_tinder/messages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:get/get.dart';
import 'package:flip_card/flip_card.dart'; // Import flip_card package
import '../controllers/animal_controller.dart';

class LoggedInScreen extends StatefulWidget {
  const LoggedInScreen({Key? key}) : super(key: key);

  @override
  _LoggedInScreenState createState() => _LoggedInScreenState();
}

class _LoggedInScreenState extends State<LoggedInScreen> {
  final SwiperController swiperController = SwiperController();
  int _selectedIndex = 0;
  final AnimalController controller = Get.find<AnimalController>();

  List<Widget> _widgetOptions() => [
        Obx(() => Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Swiper(
                  controller: swiperController,
                  itemBuilder: (BuildContext context, int index) {
                    // Wrap the Swiper item in a FlipCard
                    return FlipCard(
                      front: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(controller.allAnimalImages[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      back: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.6,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Cat Details', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                            // Include more details here
                            SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {
                                // Action for "Message Owner"
                              },
                              child: Text('Message Owner'),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: controller.allAnimalImages.length,
                  layout: SwiperLayout.STACK,
                  itemWidth: MediaQuery.of(context).size.width * 0.8,
                  itemHeight: MediaQuery.of(context).size.height * 0.6,
                ),
                Positioned( // Adjust position to move buttons up
                  bottom: MediaQuery.of(context).size.height * 0.15,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FloatingActionButton(
                        heroTag: "btn1",
                        backgroundColor: Colors.white,
                        child: const Icon(Icons.close, color: Colors.red, size: 36),
                        onPressed: () => swiperController.next(),
                      ),
                      FloatingActionButton(
                        heroTag: "btn2",
                        backgroundColor: Colors.white,
                        child: const Icon(Icons.check_circle, color: Colors.green, size: 36),
                        onPressed: () => swiperController.next(),
                      ),
                    ],
                  ),
                ),
              ],
            )),
        const Center(child: Text('Another Tab Content')),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Purrfect Match!'),
        centerTitle: true,
      ),
      body: Center(
        child: _widgetOptions().elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.heart), label: 'Likes'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.settings), label: 'Settings'),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
      ),
    );
  }
}
