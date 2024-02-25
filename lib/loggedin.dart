import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:get/get.dart'; // Make sure to import GetX if you're using it for state management
import '../controllers/animal_controller.dart';

class LoggedInScreen extends StatelessWidget {
  const LoggedInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Assuming AnimalController is already registered with GetX
    final AnimalController controller = Get.find<AnimalController>();
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Swipe Through Animals'),
        centerTitle: true,
      ),
      body: Obx(() => Swiper(
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
    );
  }
}
