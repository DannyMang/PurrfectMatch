
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageService{
  final Reference firebaseStorageRef = FirebaseStorage.instance.ref();

  Future<String?> getImage(String? imgName) async {
    if (imgName == null) {
      return null;
    }
    try {
      var urlRef = firebaseStorageRef
          .child('${imgName.toLowerCase()}.jpg');
      var imgUrl = await urlRef.getDownloadURL();
      return imgUrl;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
