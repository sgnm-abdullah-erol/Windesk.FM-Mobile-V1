import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generator_work_order/work_order_details_model.g.dart';

@JsonSerializable()
class WorkOrderDetailsModel extends Equatable {
  final String? id;
  final String? code;
  final String? name;
  final String? module;
  final String? service;
  final dynamic modulecode;
  final dynamic modulename;
  final String? modulelocation;
  final String? status;
  final String? statusname;
  final dynamic responsible;
  final String? iuser;
  final String? idate;
  final String? plannedStartdate;
  final dynamic plannedEnddate;
  final dynamic plannedTime;
  final String? priority;
  final String? actualStartdate;
  final dynamic actualEnddate;
  final dynamic actualTime;
  final dynamic downtime;
  final String? permissionneed;
  final String? closeneed;
  final String? worksafetyneed;
  final String? enfectionrisk;
  final dynamic description;

  const WorkOrderDetailsModel({
    this.id,
    this.code,
    this.name,
    this.module,
    this.service,
    this.modulecode,
    this.modulename,
    this.modulelocation,
    this.status,
    this.statusname,
    this.responsible,
    this.iuser,
    this.idate,
    this.plannedStartdate,
    this.plannedEnddate,
    this.plannedTime,
    this.priority,
    this.actualStartdate,
    this.actualEnddate,
    this.actualTime,
    this.downtime,
    this.permissionneed,
    this.closeneed,
    this.worksafetyneed,
    this.enfectionrisk,
    this.description,
  });

  factory WorkOrderDetailsModel.fromJson(Map<String, dynamic> json) => _$WorkOrderDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$WorkOrderDetailsModelToJson(this);

  @override
  List<Object?> get props => [
        id,
        code,
        name,
        module,
        service,
        modulecode,
        modulename,
        modulelocation,
        status,
        statusname,
        responsible,
        iuser,
        idate,
        plannedStartdate,
        plannedEnddate,
        plannedTime,
        priority,
        actualStartdate,
        actualEnddate,
        actualTime,
        downtime,
        permissionneed,
        closeneed,
        worksafetyneed,
        enfectionrisk,
        description,
      ];
}
