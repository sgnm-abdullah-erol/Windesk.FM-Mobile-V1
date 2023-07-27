import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'generator/work_space_requirement_materials_list.g.dart';

@JsonSerializable()
class WorkSpaceRequirementMaterialsList extends Equatable {
  final int? id;
  final List<String>? label;
  final String? name;
  final String? amount;
  final String? measurementUnit;
  final String? user;
  final dynamic totalAmount;
  final DateTime? materialRequestedDate;

  const WorkSpaceRequirementMaterialsList({
    this.id,
    this.label,
    this.name,
    this.amount,
    this.measurementUnit,
    this.user,
    this.totalAmount,
    this.materialRequestedDate,
  });

  factory WorkSpaceRequirementMaterialsList.fromJson(Map<String, dynamic> json) => _$WorkSpaceRequirementMaterialsListFromJson(json);

  Map<String, dynamic> toJson() => _$WorkSpaceRequirementMaterialsListToJson(this);

  static List<WorkSpaceRequirementMaterialsList> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => WorkSpaceRequirementMaterialsList.fromJson(json)).toList();
  }

  @override
  List<Object?> get props => [
        id,
        label,
        name,
        amount,
        measurementUnit,
        user,
        totalAmount,
        materialRequestedDate,
      ];
}
