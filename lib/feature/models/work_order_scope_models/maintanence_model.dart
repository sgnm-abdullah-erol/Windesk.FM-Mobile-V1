import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vm_fm_4/feature/models/work_order_scope_models/maintanence_plan_model.dart';
import 'package:vm_fm_4/feature/models/work_order_scope_models/scheduleby_model.dart';

part 'generator_work_order_scope_model/maintanence_model.g.dart';

@JsonSerializable()
class MaintanenceModel extends Equatable {
    final int? id;
    final List<MaintanencePlanModel>? maintenancePlan;
    final List<SchedulebyModel>? scheduledBy;

  const MaintanenceModel({
        this.id,
        this.maintenancePlan,
        this.scheduledBy,
  });

  factory MaintanenceModel.fromJson(Map<String, dynamic> json) => _$MaintanenceModelFromJson(json);

  Map<String, dynamic> toJson() => _$MaintanenceModelToJson(this);
  
  static List<MaintanenceModel> fromJsonList(List<dynamic> json) {
    List<MaintanenceModel> maintanenceModel = [];
    for (var item in json) {
      maintanenceModel.add(MaintanenceModel.fromJson(item));
    }
    return maintanenceModel;
    }


  @override
  List<Object?> get props => [
        id,
        maintenancePlan,
        scheduledBy,
      ];
}
