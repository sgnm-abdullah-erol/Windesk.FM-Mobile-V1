import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:vm_fm_4/core/l10n/locale_keys.g.dart';

import '../../../../feature/components/appbar/custom_main_appbar.dart';
import '../../../../feature/components/cards/custom_wo_create_card.dart';
import '../../../../feature/components/photo_showing/photo_with_text.dart';
import '../../../../feature/models/home_page_models/asset_document_model.dart';
import '../../../../feature/models/home_page_models/asset_image_model.dart';
import '../../../../feature/models/home_page_models/asset_list_model.dart';

@RoutePage()
class AssetDetailScreen extends StatelessWidget {
  const AssetDetailScreen(
      {super.key,
      required this.assetListModel,
      this.assetImageModel,
      this.assetDocumentModel,
      required this.imageExist,
      required this.documentExist});

  final AssetListModel assetListModel;
  final List<AssetImageModel>? assetImageModel;
  final List<AssetDocumentModel>? assetDocumentModel;
  final bool imageExist;
  final bool documentExist;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomMainAppbar(title: Text(LocaleKeys.assetDetail), returnBack: true),
      body: Column(
        children: [
          Expanded(
            child: WoCreateCard(
              widget1: _DoubleRowInformation(
                firstLabel: LocaleKeys.name,
                secondLabel: LocaleKeys.description,
                firstValue: assetListModel.name ?? '',
                secondValue: assetListModel.description ?? '',
              ),
              widget2: const SizedBox(height: 10),
              widget3: _DoubleRowInformation(
                firstLabel: LocaleKeys.serialNo,
                secondLabel: LocaleKeys.structureName,
                firstValue: assetListModel.serialNo ?? '',
                secondValue: '',
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Text(LocaleKeys.images),
          const Divider(),
          photosListView(),
          const Text(LocaleKeys.documents),
          const Divider(),
          documentsListView()
        ],
      ),
    );
  }

  Expanded documentsListView() {
    return Expanded(
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: assetDocumentModel?.length ?? 0,
          itemBuilder: (context, index) {
            return ListTile(
              title: Link(
                uri: Uri.parse(assetDocumentModel?[index].url ?? ''),
                target: LinkTarget.blank,
                builder: (BuildContext ctx, FollowLink? openLink) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(assetDocumentModel?[index].name ?? ''),
                      TextButton.icon(
                        onPressed: openLink,
                        label: const Text('Dökümana Git'),
                        icon: const Icon(Icons.read_more),
                      ),
                    ],
                  );
                },
              ),
              onTap: () {},
            );
          }),
    );
  }

  Expanded photosListView() {
    return Expanded(
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: assetImageModel!.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(assetImageModel![index].name),
                  ActivitiesPhoto(
                    photoAdress: assetImageModel![index].url,
                  ),
                ],
              ),
              onTap: () {},
            );
          }),
    );
  }
}

class _DoubleRowInformation extends StatelessWidget {
  const _DoubleRowInformation({required this.firstLabel, required this.secondLabel, required this.firstValue, required this.secondValue});

  final String firstLabel;
  final String secondLabel;

  final String firstValue;
  final String secondValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(firstLabel, style: Theme.of(context).textTheme.bodyMedium),
            Text(firstValue, style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(secondLabel, style: Theme.of(context).textTheme.bodyMedium),
            Text(secondValue, style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ],
    );
  }
}
