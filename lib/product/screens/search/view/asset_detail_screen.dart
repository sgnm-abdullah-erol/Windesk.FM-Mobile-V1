import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vm_fm_4/feature/components/appbar/custom_main_appbar.dart';
import 'package:vm_fm_4/feature/components/cards/custom_wo_create_card.dart';
import 'package:vm_fm_4/feature/l10n/locale_keys.g.dart';
import 'package:vm_fm_4/feature/models/home_page_models/asset_image_model.dart';
import 'package:vm_fm_4/feature/models/home_page_models/asset_list_model.dart';

@RoutePage()
class AssetDetailScreen extends StatelessWidget {
  const AssetDetailScreen({super.key, required this.assetListModel, this.assetImageModel, required this.imageExist});

  final AssetListModel assetListModel;
  final List<AssetImageModel>? assetImageModel;
  final bool imageExist;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomMainAppbar(title: Text(LocaleKeys.assetDetail), returnBack: true),
      body: Column(
        children: [
          WoCreateCard(
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
              secondValue: assetListModel.structureName ?? '',
            ),
          ),
          imageExist
              ? Align(
                  child: SizedBox(
                    height: 200,
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Image(
                              image: NetworkImage(assetImageModel![index].url),
                              height: 200,
                            ),
                            onTap: () {},
                          );
                        }),
                  ),
                )
              : Container(),
        ],
      ),
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
