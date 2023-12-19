import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vm_fm_4/feature/models/work_order_scope_models/checklist_has_regulation_model.dart';
import 'package:vm_fm_4/feature/models/work_order_scope_models/includesof_check_item_model.dart';

part 'generator_work_order_support_model/checklist_model.g.dart';

@JsonSerializable()
class CheckListModel extends Equatable {
  final String? name;
  final int? id;
  final List<CheckListHasRegulationModel>? hasRegulations;
  final List<IncludesOfCheckItemModel>? includesOfCheckItems;

  const CheckListModel({
    this.name,
    this.id,
    this.hasRegulations,
    this.includesOfCheckItems,
  });

  factory CheckListModel.fromJson(Map<String, dynamic> json) =>
      _$CheckListModelFromJson(json);

  static List<CheckListModel> fromJsonList(List<dynamic> json) {
    List<CheckListModel> checkListModel = [];

    for (var item in json) {
      checkListModel.add(CheckListModel.fromJson(item));
    }
    return checkListModel;
  }

  Map<String, dynamic> toJson() => _$CheckListModelToJson(this);

  @override
  List<Object?> get props => [
        name,
        id,
        hasRegulations,
        includesOfCheckItems,
      ];
}
