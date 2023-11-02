import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generator/work_space_spareparts.g.dart';

@JsonSerializable()
class WorkSpaceSpareparts extends Equatable {
  final int? nodeId;
  final String? id;
  final List<String>? label;
  final String? name;
  final dynamic amount;
  final String? measurementUnit;
  final dynamic totalAmount;
  final String? materialUsedDate;
  final String? user;

  const WorkSpaceSpareparts({
    this.nodeId,
    this.id,
    this.label,
    this.name,
    this.amount,
    this.measurementUnit,
    this.totalAmount,
    this.materialUsedDate,
    this.user,
  });

  factory WorkSpaceSpareparts.fromJson(Map<String, dynamic> json) => _$WorkSpaceSparepartsFromJson(json);

  static List<WorkSpaceSpareparts> fromJsonList(List<dynamic> jsonList) {
    List<WorkSpaceSpareparts> workSpaceSparepartsList = [];
    for (var json in jsonList) {
      workSpaceSparepartsList.add(WorkSpaceSpareparts.fromJson(json));
    }
    return workSpaceSparepartsList;
  }

  Map<String, dynamic> toJson() => _$WorkSpaceSparepartsToJson(this);

  @override
  List<Object?> get props => [
        nodeId,
        id,
        label,
        name,
        amount,
        measurementUnit,
        totalAmount,
        materialUsedDate,
        user,
      ];
}
