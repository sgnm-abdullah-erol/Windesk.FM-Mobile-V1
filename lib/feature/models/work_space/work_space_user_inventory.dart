import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'work_space_user_inventory_properties.dart';
import 'work_space_user_material.dart';

part 'generator/work_space_user_inventory.g.dart';

@JsonSerializable()
class WorkSpaceUserInventory extends Equatable {
  final int? id;
  final List<String>? labels;
  final WorkSpaceUserInventoryProperties? properties;
  final List<WorkSpaceUserMaterial>? materials;

  const WorkSpaceUserInventory({
    this.id,
    this.labels,
    this.properties,
    this.materials,
  });

  factory WorkSpaceUserInventory.fromJson(Map<String, dynamic> json) => _$WorkSpaceUserInventoryFromJson(json);

  Map<String, dynamic> toJson() => _$WorkSpaceUserInventoryToJson(this);

  @override
  List<Object?> get props => [
        id,
        labels,
        properties,
        materials,
      ];
}
