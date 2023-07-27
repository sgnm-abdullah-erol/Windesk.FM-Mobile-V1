import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class WorkOrderAddDocumantSheetProvider extends ChangeNotifier {
  final ImagePicker picker = ImagePicker();
  XFile? image;
  File? fileImage;
  String imagePath = '';

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isImageAdded = false;
  bool get isImageAdded => _isImageAdded;

  String _desc = '';
  String get desc => _desc;

  void update() {
    notifyListeners();
  }

  void getImageFromGallery() async {
    image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imagePath = image!.path;
      fileImage = File(imagePath);

      notifyListeners();
    }
  }

  void getImageFromCamera() async {
    image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      imagePath = image!.path;
      fileImage = File(imagePath);

      notifyListeners();
    }
  }

  void addImage() {
    _isLoading = true;
    notifyListeners();
  }

  void setDesc(String desc) {
    _desc = desc;
  }
}
