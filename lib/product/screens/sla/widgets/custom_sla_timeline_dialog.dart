import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:vm_fm_4/core/constants/other/colors.dart';
import 'package:vm_fm_4/feature/extensions/context_extension.dart';
import 'package:vm_fm_4/generated/locale_keys.g.dart';
import 'package:vm_fm_4/product/screens/sla/provider/sla_time_line_provider.dart';

class CustomSlaTimeLineDialog extends StatelessWidget {
  const CustomSlaTimeLineDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      surfaceTintColor: APPColors.Main.white,
      content: ChangeNotifierProvider(
        create: (_) => SlaTimeLineProvider(),
        child: Consumer<SlaTimeLineProvider>(
          builder: (context, provider, child) {
            provider.init();
            return provider.isLoading ? const _Loading() : _Body(provider);
          },
        ),
      ),
    );
  }
}

class _Loading extends StatelessWidget {
  const _Loading();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height / 8,
      width: context.width / 12,
      child: const Center(child: CircularProgressIndicator()),
    );
  }
}

class _Body extends StatelessWidget {
  _Body(this.provider);

  final SlaTimeLineProvider provider;

  //TODO dummy data, servisten alinacak ve listview'a verilecek
  final List<String> _dummyDateList = [
    '10.10.2021: 10:10:10',
    '10.10.2021: 10:10:10',
    '10.10.2021: 10:10:10',
    '10.10.2021: 10:10:10',
    '10.10.2021: 10:10:10',
    '10.10.2021: 10:10:10',
    '10.10.2021: 10:10:10'
  ];

  final List<String> _dummyStateList = [
    'state1',
    'state2',
    'state3',
    'state4',
    'state5',
    'state6',
    'state7',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height / 2,
      width: context.width / 1.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(LocaleKeys.SLAStates.tr(), style: Theme.of(context).textTheme.bodyMedium),
          const Divider(),
          const SizedBox(height: 10),
          SizedBox(
            height: context.height / 3,
            width: context.width / 1.5,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _dummyDateList.length,
                itemBuilder: (context, index) {
                  return _TimeLine(state: _dummyStateList[index], date: _dummyDateList[index], index: index);
                },
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Spacer(),
          Align(
            alignment: Alignment.bottomRight,
            child: ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(LocaleKeys.Close.tr(), style: Theme.of(context).textTheme.bodyMedium),
            ),
          )
        ],
      ),
    );
  }
}

class _TimeLine extends StatelessWidget {
  const _TimeLine({required this.state, required this.date, required this.index});

  final int index;
  final String state;
  final String date;

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      alignment: TimelineAlign.center,
      indicatorStyle: IndicatorStyle(
        width: 25,
        height: 25,
        indicator: Container(
          decoration: BoxDecoration(color: APPColors.Main.red, borderRadius: BorderRadius.circular(20)),
          child: Center(child: Text('${index + 1}', style: const TextStyle(color: Colors.white, fontSize: 15))),
        ),
      ),
      endChild: _endChild(context),
      startChild: _startChild(context),
    );
  }

  Container _endChild(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: 60, minHeight: 60, maxHeight: 100),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 5),
          child: Text(date, style: Theme.of(context).textTheme.labelSmall),
        ),
      ),
    );
  }

  Container _startChild(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: 30, maxWidth: 50, minHeight: 60),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 5),
          child: Text(state, style: Theme.of(context).textTheme.labelMedium),
        ),
      ),
    );
  }
}
