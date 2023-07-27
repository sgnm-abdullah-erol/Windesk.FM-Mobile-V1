import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generator_wo_create/wo_create_leaf_children_model.g.dart';

@JsonSerializable()
class WoCreateLeafChildrenModel extends Equatable {
  final List<String>? labels;
  final bool? canDisplay;
  final DateTime? createdAt;
  final bool? isDeleted;
  final String? name;
  final bool? canDelete;
  final List<dynamic>? tag;
  final bool? isActive;
  final String? nodeType;
  final String? key;
  final int? id;
  final bool? leaf;

  const WoCreateLeafChildrenModel({
    this.labels,
    this.canDisplay,
    this.createdAt,
    this.isDeleted,
    this.name,
    this.canDelete,
    this.tag,
    this.isActive,
    this.nodeType,
    this.key,
    this.id,
    this.leaf,
  });
  factory WoCreateLeafChildrenModel.fromJson(Map<String, dynamic> json) => _$WoCreateLeafChildrenModelFromJson(json);

  Map<String, dynamic> toJson() => _$WoCreateLeafChildrenModelToJson(this);

  @override
  List<Object?> get props => [
        labels,
        canDisplay,
        createdAt,
        isDeleted,
        name,
        canDelete,
        tag,
        isActive,
        nodeType,
        key,
        id,
        leaf,
      ];
}
