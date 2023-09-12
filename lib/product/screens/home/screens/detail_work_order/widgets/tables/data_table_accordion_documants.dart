import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:internet_file/internet_file.dart';
import 'package:internet_file/storage_io.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import '../../../../../../../feature/extensions/context_extension.dart';
import '../../../../../../../generated/locale_keys.g.dart';
import '../../../../../../../feature/models/work_space/work_space_documents.dart';

import '../../../../../../../core/constants/other/app_icons.dart';
import '../../../../../../../core/constants/other/colors.dart';
import '../../provider/download_provider.dart';

class DataTableAccordionDocumants extends StatelessWidget {
  DataTableAccordionDocumants({super.key, required this.delete, required this.data});

  final Function delete;
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
                              _downloadFile(context, data[i].url ?? '', data[i].name ?? '');
                              // Directory appDocDirectory = await getApplicationDocumentsDirectory();

                              // provider.downloadFile(("${appDocDirectory.path}/${data[i].name ?? ''}"), data[i].url ?? '');
                            },
                            icon: Icon(AppIcons.download, color: APPColors.Login.green),
                          ),
                  ),
                ),
              ),
              DataCell(
                IconButton(
                  onPressed: () => delete(),
                  icon: Icon(AppIcons.delete, color: APPColors.Login.red),
                ),
              ),
            ]),
          },
        ],
      ),
    );
  }

  void _downloadFile(BuildContext context, String url, String name) async {
    final storageIO = InternetFileStorageIO();
    Directory appDocDir = await getApplicationDocumentsDirectory();

    await InternetFile.get(
      url,
      storage: storageIO,
      storageAdditional: storageIO.additional(
        filename: name,
        location: appDocDir.path,
      ),
      force: true,
      progress: (receivedLength, contentLength) {},
    );
  }

  TextStyle _cellTextStyle(BuildContext context) => context.labelMedium.copyWith(color: APPColors.Main.black);
}
