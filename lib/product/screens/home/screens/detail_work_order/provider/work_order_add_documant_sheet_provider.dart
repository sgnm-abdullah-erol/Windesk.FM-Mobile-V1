import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../feature/database/shared_manager.dart';
import '../../../../../../feature/enums/shared_enums.dart';
import '../../../../../../feature/injection.dart';
import '../../../../../../feature/service/global_services.dart/work_space_service/work_space_service_repository_impl.dart';

class WorkOrderAddDocumantSheetProvider extends ChangeNotifier {
  final ImagePicker picker = ImagePicker();
  final WorkSpaceServiceRepositoryImpl workSpaceService =
      Injection.getIt.get<WorkSpaceServiceRepositoryImpl>();

  XFile? image;
  File? fileImage;
  String imagePath = '';

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isImageAdded = false;
  bool get isImageAdded => _isImageAdded;

  bool _isPdfAdded = false;
  bool get isPdfAdded => _isPdfAdded;

  bool _isPdfPicked = false;
  bool get isPdfPicked => _isPdfPicked;

  String _pdfPath = '';
  String get pdfPath => _pdfPath;

  String _pdfName = '';

  String _desc = '';
  String get desc => _desc;

  void changeDesc(val) {
    _desc = val;
  }

  void update() {
    notifyListeners();
  }

  void saveImage(String taskId, String taskKey) async {
    _isLoading = true;
    notifyListeners();

    final String token = await SharedManager().getString(SharedEnum.userToken);

    final response = await workSpaceService.saveDocumant(
        imagePath, '', _desc, token, taskId, taskKey, 'image');

    response.fold(
      (l) => {
        l
            ? {
                _isImageAdded = true,
              }
            : {
                _isImageAdded = false,
              }
      },
      (r) => {},
    );

    _isLoading = false;
    notifyListeners();

    Future.delayed(const Duration(seconds: 2), () {
      _isImageAdded = false;
    });
  }

  void savePdf(String taskId, String taskKey) async {
    _isLoading = true;
    notifyListeners();

    final String token = await SharedManager().getString(SharedEnum.userToken);

    final response = await workSpaceService.saveDocumant(
        _pdfPath, _pdfName, _desc, token, taskId, taskKey, 'pdf');

    response.fold(
      (l) => {
        l
            ? {
                _isPdfAdded = true,
              }
            : {
                _isPdfAdded = false,
              }
      },
      (r) => {},
    );

    _isLoading = false;
    notifyListeners();

    Future.delayed(const Duration(seconds: 2), () {
      _isPdfAdded = false;
    });
  }

  void getPdf() async {
    final filePickerResult = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (filePickerResult != null) {
      _pdfPath = filePickerResult.files.first.path ?? '';
      _pdfName = filePickerResult.files.first.name;
      _isPdfPicked = true;
      notifyListeners();
    }
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

  void setDesc(String desc) {
    _desc = desc;
  }
}
