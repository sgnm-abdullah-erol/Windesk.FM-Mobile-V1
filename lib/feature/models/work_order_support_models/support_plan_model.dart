import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vm_fm_4/feature/models/work_order_scope_models/component_model.dart';

part 'generator_work_order_support_model/support_plan_model.g.dart';

@JsonSerializable()
class SupportPlanModel extends Equatable {
    final List<ComponentModel>? components;
    final List<dynamic>? facilityStructures;
    final List<dynamic>? systems;

  const SupportPlanModel({
        this.components,
        this.facilityStructures,
        this.systems,
  });

  factory SupportPlanModel.fromJson(Map<String, dynamic> json) => _$SupportPlanModelFromJson(json);

  Map<String, dynamic> toJson() => _$SupportPlanModelToJson(this);

  @override
  List<Object?> get props => [
        components,
        facilityStructures,
        systems,
      ];
}
