import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generator_work_order/work_order_loads.g.dart';

@JsonSerializable()
class WorkOrderLoads extends Equatable {
  final String? code;
  final String? user;
  final dynamic startdate;
  final String? type;
  final String? typeName;
  final double? timeworked;

  const WorkOrderLoads({
    this.code,
    this.user,
    this.startdate,
    this.type,
    this.typeName,
    this.timeworked,
  });

  factory WorkOrderLoads.fromJson(Map<String, dynamic> json) => _$WorkOrderLoadsFromJson(json);

  Map<String, dynamic> toJson() => _$WorkOrderLoadsToJson(this);

  List<WorkOrderLoads> fromJsonList(List<dynamic> json) {
    List<WorkOrderLoads> workOrderLoads = [];

    for (var item in json) {
      workOrderLoads.add(WorkOrderLoads.fromJson(item));
    }

    return workOrderLoads;
  }

  @override
  List<Object?> get props => [
        code,
        user,
        startdate,
        type,
        typeName,
        timeworked,
      ];
}
