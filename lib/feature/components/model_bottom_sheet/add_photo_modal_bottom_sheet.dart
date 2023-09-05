import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/constants/style/border_radius.dart';
import '../../../generated/locale_keys.g.dart';
import '../buttons/custom_half_buttons.dart';

class AddPhotoModalBottomSheet extends StatelessWidget {
  const AddPhotoModalBottomSheet(this.saveImageFunction, this.saveDescFunction, this.addPhotoFunction, this.hintDescText, {super.key});
  final Function saveImageFunction;
  final Function saveDescFunction;
  final Function addPhotoFunction;
  final String hintDescText;
  @override
  Widget build(BuildContext context) {
    return _bodyWidget(context);
  }

  _bodyWidget(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: Column(
          children: [
            _PhotoStack(saveImageFunction: saveImageFunction),
            Expanded(flex: 20, child: _descriptionTextField(saveDescFunction, hintDescText)),
            _buttons(context, addPhotoFunction),
            const Spacer(flex: 10),
          ],
        ),
      ),
    );
  }

  Expanded _buttons(context, Function addPhotoFunction) {
    return Expanded(
      flex: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomHalfButtons(
              leftTitle: const Text(LocaleKeys.Cancel).tr(),
              rightTitle: const Text(LocaleKeys.Approve).tr(),
              leftOnPressed: () => Navigator.pop(context),
              rightOnPressed: addPhotoFunction)
        ],
      ),
    );
  }

  TextField _descriptionTextField(Function saveDescFuntion, hintDescText) {
    return TextField(
      maxLines: 3,
      minLines: 1,
      decoration: InputDecoration(hintText: hintDescText),
      onChanged: (value) {
        saveDescFuntion(value);
      },
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Function>('saveImage', addPhotoFunction));
  }
}

class _PhotoStack extends StatefulWidget {
  const _PhotoStack({required this.saveImageFunction});
  final Function saveImageFunction;

  @override
  State<_PhotoStack> createState() => _PhotoStackState();
}

class _PhotoStackState extends State<_PhotoStack> {
  _PhotoStackState();
  File? _image;

  final ImagePicker _imagePicker = ImagePicker();

  Future getImage() async {
    final image = await _imagePicker.pickImage(source: ImageSource.camera);
    if (image != null) {
      _image = File((image).path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 50,
      child: Stack(
        children: [
          Container(color: Colors.grey),
          _image == null
              ? const SizedBox()
              : SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Image.file(_image!, fit: BoxFit.fitWidth),
                ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: FloatingActionButton(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.white, width: 1.0),
                  borderRadius: CustomBorderRadius.circularBorderRadius,
                ),
                onPressed: () {
                  getImage().then((value) {
                    widget.saveImageFunction(value);
                  }).then((value) {
                    setState(() {});
                  });
                  setState(() {});
                },
                child: const Icon(Icons.add, size: 36),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
