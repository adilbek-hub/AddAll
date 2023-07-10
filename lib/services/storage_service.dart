import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class StorageService {
  final storageRef = FirebaseStorage.instance.ref();
  Future<List<String>?> uploadImage(List<XFile> images) async {
    if (images.isNotEmpty) {
      List<String> urls = [];
      for (var surottor in images) {
        final mountainsRef =
            storageRef.child("images/${DateTime.now().day}/${surottor.name}");
        try {
          final file = File(surottor.path);
          final uploadTask = await mountainsRef.putFile(file);
          final url = await uploadTask.ref.getDownloadURL();
          urls.add(url);
        } catch (e) {
          print(e.toString());
        }
      }
      return urls;
    } else {
      return null;
    }
  }
}
