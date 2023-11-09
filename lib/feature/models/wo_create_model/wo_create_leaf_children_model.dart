import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generator_wo_create/wo_create_leaf_children_model.g.dart';

@JsonSerializable()
class WoCreateLeafChildrenModel extends Equatable {
    final List<String>? labels;
    final List<String>? roomTag;
    final bool? canDisplay;
    final int? netArea;
    final String? images;
    final int? grossArea;
    final String? code;
    final String? architecturalCode;
    final String? documents;
    final bool? isBlocked;
    final String? description;
    final String? nodeType;
    final bool? isActive;
    final String? externalSystem;
    final DateTime? createdAt;
    final String? externalObject;
    final bool? isDeleted;
    final String? name;
    final String? externalIdentifier;
    final String? architecturalName;
    final int? usableHeight;
    final bool? canDelete;
    final List<dynamic>? tag;
    final String? key;
    final int? id;
    final bool? leaf;

  const WoCreateLeafChildrenModel({
        this.labels,
        this.roomTag,
        this.canDisplay,
        this.netArea,
        this.images,
        this.grossArea,
        this.code,
        this.architecturalCode,
        this.documents,
        this.isBlocked,
        this.description,
        this.nodeType,
        this.isActive,
        this.externalSystem,
        this.createdAt,
        this.externalObject,
        this.isDeleted,
        this.name,
        this.externalIdentifier,
        this.architecturalName,
        this.usableHeight,
        this.canDelete,
        this.tag,
        this.key,
        this.id,
        this.leaf,
  });
  factory WoCreateLeafChildrenModel.fromJson(Map<String, dynamic> json) => _$WoCreateLeafChildrenModelFromJson(json);

  Map<String, dynamic> toJson() => _$WoCreateLeafChildrenModelToJson(this);

  @override
  List<Object?> get props => [
      labels,
      roomTag,
      canDisplay,
      netArea,
      images,
      grossArea,
      code,
      architecturalCode,
      documents,
      isBlocked,
      description,
      nodeType,
      isActive,
      externalSystem,
      createdAt,
      externalObject,
      isDeleted,
      name,
      externalIdentifier,
      architecturalName,
      usableHeight,
      canDelete,
      tag,
      key,
      id,
      leaf,
      ];
}
