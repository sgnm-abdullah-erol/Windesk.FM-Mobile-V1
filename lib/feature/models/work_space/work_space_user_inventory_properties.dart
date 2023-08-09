import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generator/work_space_user_inventory_properties.g.dart';

@JsonSerializable()
class WorkSpaceUserInventoryProperties extends Equatable {
  final bool? isDeleted;
  final String? name;

  const WorkSpaceUserInventoryProperties({
    this.isDeleted,
    this.name,
  });

  factory WorkSpaceUserInventoryProperties.fromJson(Map<String, dynamic> json) => _$WorkSpaceUserInventoryPropertiesFromJson(json);

  Map<String, dynamic> toJson() => _$WorkSpaceUserInventoryPropertiesToJson(this);

  @override
  List<Object?> get props => [
        isDeleted,
        name,
      ];
}
