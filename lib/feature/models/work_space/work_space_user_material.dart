import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vm_fm_4/feature/models/work_space/work_space_material_properties.dart';
part 'generator/work_space_user_material.g.dart';

@JsonSerializable()
class WorkSpaceUserMaterial extends Equatable {
  final List<String>? labels;
  final WorkSpaceMaterialProperties? properties;
  final int? id;

  const WorkSpaceUserMaterial({
    this.labels,
    this.properties,
    this.id,
  });

  factory WorkSpaceUserMaterial.fromJson(Map<String, dynamic> json) => _$WorkSpaceUserMaterialFromJson(json);

  Map<String, dynamic> toJson() => _$WorkSpaceUserMaterialToJson(this);

  @override
  List<Object?> get props => [
        labels,
        properties,
        id,
      ];
}
