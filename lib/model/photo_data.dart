import 'package:firebase_storage/firebase_storage.dart';

class PhotoStorage {
  Future<List<String>> getImageUrls() async {
    List<String> imageUrls = [];
    ListResult result = await FirebaseStorage.instance.ref('data').listAll();

    for (Reference ref in result.items) {
      String url = await ref.getDownloadURL();
      imageUrls.add(url);
    }

    return imageUrls;
  }
}
