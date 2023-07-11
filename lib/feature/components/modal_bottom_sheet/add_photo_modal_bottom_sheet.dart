// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:provider/provider.dart';
// import 'package:vm_fm_4/feature/extensions/context_extension.dart';

// import '../../constants/other/colors.dart';

// class AddPhotoModalBottomSheet extends StatelessWidget {
//   const AddPhotoModalBottomSheet(this.actionsProvider);
//   final Provider actionsProvider;
//   @override
//   Widget build(BuildContext context) {
//     return _bodyWidget(context);
//   }

//   _bodyWidget(BuildContext context) {
//     return SizedBox(
//       height: MediaQuery.of(context).size.height * 0.9,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
//         child: Column(
//           children: [
//             _PhotoStack(),
//             Expanded(flex: 20, child: _descriptionTextField(actionsProvider)),
//             _buttons(actionsProvider),
//             const Spacer(flex: 10),
//           ],
//         ),
//       ),
//     );
//   }

//   Expanded _buttons(Provider buttonActionsProvider) {
//     return Expanded(
//       flex: 20,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           _CancelImage(),
//           SizedBox(width: 10),
//           _SaveImage(providerButtonActionSave: buttonActionsProvider)
//         ],
//       ),
//     );
//   }

//   TextField _descriptionTextField(WoDetailViewProvider woDetailViewProvider) {
//     return TextField(
//       maxLines: 3,
//       minLines: 1,
//       decoration: InputDecoration(hintText: _hintDescription),
//       onChanged: (value) {
//         woDetailViewProvider.setImageDesc = value.toString();
//       },
//     );
//   }
// }

// class _CancelImage extends StatelessWidget {
//   const _CancelImage();

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: context.width * 0.3,
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: APPColors.Login.red,
//           shape: const RoundedRectangleBorder(
//               borderRadius: BorderRadius.all(Radius.circular(15))),
//         ),
//         onPressed: () {
//           Navigator.pop(context);
//         },
//         child: (const Text('Vazgeç')),
//       ),
//     );
//   }
// }

// class _SaveImage extends StatelessWidget {
//   const _SaveImage({
//     required this.providerButtonActionSave,
//   });

//   final Provider providerButtonActionSave;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: context.width * 0.3,
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: APPColors.Login.blue,
//           shape: const RoundedRectangleBorder(
//               borderRadius: BorderRadius.all(Radius.circular(15))),
//         ),
//         onPressed: () {
//           woDetailViewProvider.saveImage();
//           Navigator.pop(context);
//         },
//         child: (const Text('Kaydet')),
//       ),
//     );
//   }
// }

// class _PhotoStack extends StatefulWidget {
//   const _PhotoStack({required this.actionsProvider});
//   final Provider actionsProvider;

//   @override
//   State<_PhotoStack> createState() => _PhotoStackState();
// }

// class _PhotoStackState extends State<_PhotoStack> {
//   File? _image;

//   final ImagePicker _imagePicker = ImagePicker();

//   Future getImage() async {
//     final image = await _imagePicker.getImage(source: ImageSource.camera);
//     if (image != null) {
//       _image = File(image.path);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       flex: 50,
//       child: Stack(
//         children: [
//           Container(color: Colors.grey),
//           widget.actionsProvider.image == null
//               ? const SizedBox()
//               : SizedBox(
//                   width: MediaQuery.of(context).size.width,
//                   child: Image.file(widget.actionsProvider.image!,
//                       fit: BoxFit.fitWidth),
//                 ),
//           Align(
//             alignment: Alignment.bottomRight,
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: FloatingActionButton(
//                 shape: RoundedRectangleBorder(
//                   side: const BorderSide(color: Colors.white, width: 1.0),
//                   borderRadius: BorderRadius.circular(100.0),
//                 ),
//                 onPressed: () {
//                   getImage().then((value) {
//                     widget.woDetailProvider.setImage = _image;
//                   }).then((value) {
//                     setState(() {});
//                   });
//                 },
//                 child: const Icon(Icons.add, size: 36),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
