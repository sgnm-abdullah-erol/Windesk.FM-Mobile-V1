// ignore_for_file: unused_local_variable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:vm_fm_4/feature/components/snackBar/snackbar.dart';
import 'package:vm_fm_4/generated/locale_keys.g.dart';

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

  void errorAccurWhileDownloadingFile(BuildContext context) {
    snackBar(context, LocaleKeys.ErrorAccurWhileDownloadFile.tr(), 'error');
  }

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
