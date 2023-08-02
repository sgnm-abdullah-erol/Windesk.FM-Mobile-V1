// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';

import '../../../../../../feature/injection.dart';
import '../../../../../../feature/service/global_services.dart/download/download_service_repository_impl.dart';

class DownloadProvider extends ChangeNotifier {
  final DownloadServiceRepositoryImpl downloadService = Injection.getIt.get<DownloadServiceRepositoryImpl>();

  final bool _isLoading = false;
  bool get isLoading => _isLoading;

  final bool _isDocDownloaded = false;
  bool get isDocDownloaded => _isDocDownloaded;

  final bool _isDocDownloadedError = false;
  bool get isDocDownloadedError => _isDocDownloadedError;

  // // TODO FIX THIS - TYPE LAZIM, TAM CALISMIYOR,
  // void downloadFile(String filePath, String url) async {
  //   _isLoading = true;
  //   notifyListeners();

  //   final response = await downloadService.downloadFile(url, filePath);
  //   print(response);
  //   dynamic data;

  //   response.fold(
  //     (l) => {
  //       _isDocDownloaded = true,
  //       data = l,
  //     },
  //     (r) => {
  //       _isDocDownloadedError = true,
  //     },
  //   );

  //   if (_isDocDownloaded) {
  //     // TODO FIX THIS - TYPE LAZIM
  //     Directory('$filePath.pdf').create(recursive: false).then((Directory directory) {});
  //     File file = File(filePath);
  //   }

  //   _isLoading = false;
  //   notifyListeners();

  //   Future.delayed(const Duration(seconds: 1), () {
  //     _isDocDownloaded = false;
  //     _isDocDownloadedError = false;
  //   });
  // }
}
