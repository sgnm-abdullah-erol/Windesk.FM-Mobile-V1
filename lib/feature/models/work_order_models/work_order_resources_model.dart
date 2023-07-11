import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generator_work_order/work_order_resources_model.g.dart';

@JsonSerializable()
class WorkOrderResourcesModel extends Equatable {
  final String? module;
  final String? modulecode;
  final String? name;
  final String? vardiya;

  const WorkOrderResourcesModel({
    this.module,
    this.modulecode,
    this.name,
    this.vardiya,
  });

  factory WorkOrderResourcesModel.fromJson(Map<String, dynamic> json) => _$WorkOrderResourcesModelFromJson(json);

  Map<String, dynamic> toJson() => _$WorkOrderResourcesModelToJson(this);

  static List<WorkOrderResourcesModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => WorkOrderResourcesModel.fromJson(json)).toList();
  }

  @override
  List<Object?> get props => [
        module,
        modulecode,
        name,
        vardiya,
      ];
}
