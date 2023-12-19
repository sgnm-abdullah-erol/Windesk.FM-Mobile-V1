import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vm_fm_4/feature/models/work_order_scope_models/checklist_model.dart';

part 'generator_work_order_support_model/parent_schedule_model.g.dart';

@JsonSerializable()
class ParentScheduleModel extends Equatable {
  final List<CheckListModel>? checkList;

  const ParentScheduleModel({
    this.checkList,
  });

  factory ParentScheduleModel.fromJson(Map<String, dynamic> json) =>
      _$ParentScheduleModelFromJson(json);

  static List<ParentScheduleModel> fromJsonList(List<dynamic> json) {
    List<ParentScheduleModel> parentScheduleModel = [];

    for (var item in json) {
      parentScheduleModel.add(ParentScheduleModel.fromJson(item));
    }

    return parentScheduleModel;
  }

  Map<String, dynamic> toJson() => _$ParentScheduleModelToJson(this);

  @override
  List<Object?> get props => [
        checkList,
      ];
}
