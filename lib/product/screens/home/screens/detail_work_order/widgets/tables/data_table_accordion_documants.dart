import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:provider/provider.dart';
import '../../../../../../../feature/components/snackBar/snackbar.dart';
import '../../../../../../../feature/constants/other/snackbar_strings.dart';
import '../../../../../../../feature/models/work_space/work_space_documents.dart';

import '../../../../../../../feature/constants/other/app_icons.dart';
import '../../../../../../../feature/constants/other/colors.dart';
import '../../provider/download_provider.dart';

class DataTableAccordionDocumants extends StatelessWidget {
  DataTableAccordionDocumants({super.key, required this.delete, required this.data});

  final Function delete;
  final List<String> _labelList = ['id', 'İsim', 'Tür', 'İndir', 'Sil'];
  final List<WorkSpaceDocuments> data;

  final String _nonKnownName = 'Bilinmiyor';
  final String _noEffortType = 'Çalışma Türü Belirtilmemiş';

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
                style: _cellTextStyle(),
              ),
              numeric: false,
            )
          }
        ],
        rows: [
          for (var i = 0; i < (data.length); i++) ...{
            DataRow(cells: [
              DataCell(Text(data[i].id.toString(), style: _cellTextStyle())),
              DataCell(Text(data[i].name ?? _noEffortType, style: _cellTextStyle())),
              DataCell(Text(data[i].url?.split('.').last ?? _nonKnownName, style: _cellTextStyle())),
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

  void _downloadFile(BuildContext context, String url, String name) {
    FileDownloader.downloadFile(
        url: url,
        name: name,
        onProgress: (String? fileName, double progress) {
          return Center(child: CircularProgressIndicator(value: progress));
        },
        onDownloadCompleted: (String path) {
          snackBar(context, SnackbarStrings.fileDownloaded, 'success');
        },
        onDownloadError: (String error) {
          snackBar(context, SnackbarStrings.fileNotDownloaded, 'error');
        });
  }

  TextStyle _cellTextStyle() {
    return const TextStyle(color: Colors.black);
  }
}
