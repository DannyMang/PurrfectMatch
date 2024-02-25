import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import 'package:cat_tinder/services/firebase_storage_service.dart';


class AnimalController extends GetxController {
  final allAnimalImages = <String>[].obs;

  @override
  void onInit() {
    getAllAnimalImages();
    super.onInit();
  }

  Future<void> getAllAnimalImages() async {
    // Updated list based on the image names from your Firebase Storage screenshot
    List<String> imgNames = [
      "bandit", "bella", "bisaan", "chirpie", "cleo", 
      "clown pants iv", "clownpants", "ernie", "ginger"
      // Add more names as needed
    ];
    try {
      for (var imgName in imgNames) {
        // Assuming your FirebaseStorageService is properly set up to fetch image URLs
        final imgUrl = await Get.find<FirebaseStorageService>().getImage(imgName);
        if (imgUrl != null) {
          allAnimalImages.add(imgUrl);
        }
      }
    } catch (e) {
      print(e);
    }
  }
}
