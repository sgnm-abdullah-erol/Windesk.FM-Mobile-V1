import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:vm_fm_4/feature/enums/snackbar_enums.dart';

void snackBar(BuildContext context, String message, SnackbarEnums type) async {
  if (type == 'info') {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.info(
        message: message,
      ),
    );
  } else if (type == SnackbarEnums.success) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.success(
        message: message,
      ),
    );
  } else if (type == SnackbarEnums.error) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.error(
        message: message,
      ),
      displayDuration: const Duration(seconds: 2),
    );
  } else if (type == SnackbarEnums.connect) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.connect(
        message: message,
      ),
    );
  } else if (type == SnackbarEnums.notconnect) {
    showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.notconnect(
          message: message,
        ),
        displayDuration: const Duration(hours: 2));
  } else if (type == SnackbarEnums.enumTrue) {
    showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.success(
          message: message,
        ),
        displayDuration: const Duration(seconds: 3));
  } else if (type == SnackbarEnums.enumFalse) {
    showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(
          message: message,
        ),
        displayDuration: const Duration(seconds: 3));
  } else {
    showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(
          message: message,
        ),
        displayDuration: const Duration(seconds: 3));
  }
}
