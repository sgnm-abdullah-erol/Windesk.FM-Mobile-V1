import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vm_fm_4/feature/models/work_order_support_models/support_plan_model.dart';
import 'package:vm_fm_4/feature/models/work_order_support_models/scheduleby_model.dart';
part 'generator_work_order_support_model/support_model.g.dart';

@JsonSerializable()
class SupportModel extends Equatable {
  final int? id;
  final List<SupportPlanModel>? supportPlan;
  final List<SchedulebyModel>? scheduledBy;

  const SupportModel({
    this.id,
    this.supportPlan,
    this.scheduledBy,
  });

  factory SupportModel.fromJson(Map<String, dynamic> json) =>
      _$SupportModelFromJson(json);

  Map<String, dynamic> toJson() => _$SupportModelToJson(this);

  static List<SupportModel> fromJsonList(List<dynamic> json) {
    List<SupportModel> supportModel = [];
    for (var item in json) {
      supportModel.add(SupportModel.fromJson(item));
    }
    return supportModel;
  }

  @override
  List<Object?> get props => [
        id,
        supportPlan,
        scheduledBy,
      ];
}
