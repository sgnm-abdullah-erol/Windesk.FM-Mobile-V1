import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'generator/work_space_requested_materials.g.dart';

@JsonSerializable()
class WorkSpaceRequestedMaterials extends Equatable {
  final int? id;
  final List<String>? labels;
  final String? name;
  final String? measurementUnit;
  final int? amount;

  const WorkSpaceRequestedMaterials({
    this.id,
    this.labels,
    this.name,
    this.measurementUnit,
    this.amount,
  });

  factory WorkSpaceRequestedMaterials.fromJson(Map<String, dynamic> json) => _$WorkSpaceRequestedMaterialsFromJson(json);

  Map<String, dynamic> toJson() => _$WorkSpaceRequestedMaterialsToJson(this);

  static List<WorkSpaceRequestedMaterials>? fromJsonList(List<dynamic>? jsonList) {
    if (jsonList == null) return null;
    return jsonList.map((json) => WorkSpaceRequestedMaterials.fromJson(json)).toList();
  }

  @override
  List<Object?> get props => [
        id,
        labels,
        name,
        measurementUnit,
        amount,
      ];
}
