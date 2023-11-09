// ignore_for_file: avoid_print

import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:vm_fm_4/feature/components/alert_dialog/work_order_delete_item_alert_dialog.dart';
import 'package:vm_fm_4/product/screens/home/screens/detail_work_order/provider/work_order_detail_service_provider.dart';

import '../../../../../../../core/constants/other/app_icons.dart';
import '../../../../../../../core/constants/other/colors.dart';
import '../../../../../../../core/enums/task_node_enums.dart';
import '../../../../../../../feature/extensions/context_extension.dart';
import '../../../../../../../feature/models/work_space/work_space_documents.dart';
import '../../../../../../../generated/locale_keys.g.dart';
import '../../provider/download_provider.dart';
import 'package:http/http.dart' as http;

class DataTableAccordionDocumants extends StatelessWidget {
  DataTableAccordionDocumants({super.key, required this.data, required this.provider});

  final WorkOrderDetailServiceProvider provider;
  final List<WorkSpaceDocuments> data;

  final List<String> _labelList = [
    LocaleKeys.DataTableID.tr(),
    LocaleKeys.DataTableName.tr(),
    LocaleKeys.DataTableType.tr(),
    LocaleKeys.DataTableDownload.tr(),
    LocaleKeys.DataTableDelete.tr(),
  ];

  @override
  Widget build(BuildContext context) {
    print(data);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        sortAscending: true,
        sortColumnIndex: 1,
        showBottomBorder: true,
        horizontalMargin: 0,
        columns: [
          for (var i = 0; i < _labelList.length; i++) ...{
            DataColumn(
              label: Text(
                _labelList[i],
                style: _cellTextStyle(context),
              ),
              numeric: false,
            )
          }
        ],
        rows: [
          for (var i = 0; i < (data.length); i++) ...{
            DataRow(cells: [
              DataCell(Text(data[i].id.toString(), style: _cellTextStyle(context))),
              DataCell(Text(data[i].name ?? "", style: _cellTextStyle(context))),
              DataCell(Text(data[i].url?.split('.').last ?? "", style: _cellTextStyle(context))),
              DataCell(
                ChangeNotifierProvider(
                  create: (context) => DownloadProvider(),
                  child: Consumer<DownloadProvider>(
                    builder: (context, provider, child) => provider.isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : IconButton(
                            onPressed: () async {
                              String type = data[i].url?.split('.').last ?? '';
                              if (type == 'jpg' || type == 'png' || type == 'jpeg') {
                                _downloadImage(context, data[i].url ?? '', data[i].name ?? '', type);
                              } else if (type == 'pdf') {
                                _downloadFile(context, data[i].url ?? '', data[i].name ?? '', type);
                              } else {}
                            },
                            icon: Icon(AppIcons.download, color: APPColors.Login.green),
                          ),
                  ),
                ),
              ),
              DataCell(
                IconButton(
                  onPressed: () async {
                    final response =
                        await WorkOrderDeleteItemAlertDialog.deleteWorkOrderAlertDialog(context, DeleteItemType.documant, data[i].id ?? 0);
                    if (response == true) {
                      // ignore: use_build_context_synchronously
                      provider.deleteNode(context, data[i].id.toString(), provider.detail.task?.id.toString() ?? '', TaskNodeEnums.document);
                    } else {}
                  },
                  icon: Icon(AppIcons.delete, color: APPColors.Login.red),
                ),
              ),
            ]),
          },
        ],
      ),
    );
  }

  void _downloadFile(BuildContext context, String url, String name, String type) async {
    final http.Response response = await http.get(
      Uri.parse('https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf'),
    );

    final dir = await getTemporaryDirectory();

    // Create an image name
    var filename = '${dir.path}/downloadPdf.pdf';

    // Save to filesystem
    final file = File(filename);
    await file.writeAsBytes(response.bodyBytes, flush: true);

    // Ask the user to save it
    final params = SaveFileDialogParams(sourceFilePath: file.path);
    final finalPath = await FlutterFileDialog.saveFile(params: params);

    if (finalPath != null) {
      print('pdf saved to $finalPath');
    }
  }

  void _downloadImage(BuildContext context, String url, String name, String type) async {
    final http.Response response = await http.get(
      Uri.parse('https://upload.wikimedia.org/wikipedia/commons/3/3f/Walking_tiger_female.jpg'),
    );

    final dir = await getTemporaryDirectory();

    // Create an image name
    var filename = '${dir.path}/SaveImage100.jpg';

    // Save to filesystem
    final file = File(filename);
    await file.writeAsBytes(response.bodyBytes);

    // Ask the user to save it
    final params = SaveFileDialogParams(sourceFilePath: file.path);
    final finalPath = await FlutterFileDialog.saveFile(params: params);

    if (finalPath != null) {
      print('image saved to $finalPath');
    } else {
      print('sssssssssssssssssss');
    }
  }

  // void _downloadFile(BuildContext context, String url, String name) async {
  //   final storageIO = InternetFileStorageIO();
  //   Directory appDocDir = await getApplicationDocumentsDirectory();

  //   await InternetFile.get(
  //     url,
  //     storage: storageIO,
  //     storageAdditional: storageIO.additional(
  //       filename: name,
  //       location: appDocDir.path,
  //     ),
  //     force: true,
  //     progress: (receivedLength, contentLength) {},
  //   );
  // }

  TextStyle _cellTextStyle(BuildContext context) => context.labelMedium.copyWith(color: APPColors.Main.black);
}
