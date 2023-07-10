import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  final ImagePicker _imagePicker = ImagePicker();

  Future<List<XFile>> pickImage() async {
    final images = await _imagePicker.pickMultiImage();
    return images;
  }
}
