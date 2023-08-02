import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'wo_create_location_children_model.dart';

part 'generator_wo_create/wo_create_location_model.g.dart';

@JsonSerializable()
class WoCreateLocationModel extends Equatable {
  final bool? canDisplay;
  final String? description;
  final String? nodeType;
  final bool? isActive;
  final String? createdAt;
  final bool? isDeleted;
  final String? createdBy;
  final String? name;
  final String? realm;
  final bool? canDelete;
  final List<String>? tag;
  final String? key;
  final String? updatedAt;
  final int? id;
  final bool? leaf;
  final List<WoCreateLocationChildrenModel>? children;

  const WoCreateLocationModel(
      {this.canDisplay,
      this.description,
      this.nodeType,
      this.isActive,
      this.createdAt,
      this.isDeleted,
      this.createdBy,
      this.name,
      this.realm,
      this.canDelete,
      this.tag,
      this.key,
      this.updatedAt,
      this.id,
      this.leaf,
      this.children});

  factory WoCreateLocationModel.fromJson(Map<String, dynamic> json) => _$WoCreateLocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$WoCreateLocationModelToJson(this);

  @override
  List<Object?> get props =>
      [canDisplay, description, nodeType, isActive, createdAt, isDeleted, createdBy, name, realm, canDelete, tag, key, updatedAt, id, leaf, children];

}
