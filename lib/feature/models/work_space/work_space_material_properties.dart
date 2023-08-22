import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generator/work_space_material_properties.g.dart';

@JsonSerializable()
class WorkSpaceMaterialProperties extends Equatable {
  final List<String>? referenceLabel;
  final String? creatorId;
  final String? description;
  final String? className;
  final int? type;
  final bool? externalNode;
  final bool? isActive;
  final String? referenceId;
  final String? trId;
  final DateTime? createdAt;
  final bool? isDeleted;
  final String? supplier;
  final bool? canDelete;
  final List<dynamic>? tag;
  final String? key;
  final DateTime? updatedAt;
  final bool? canDisplay;
  final String? structureName;
  final int? count;
  final String? setNumber;
  final String? measurementUnit;
  final String? tagNumber;
  final String? name;
  final String? partNumber;
  final String? deletorId;
  final String? category;

  const WorkSpaceMaterialProperties({
    this.referenceLabel,
    this.creatorId,
    this.description,
    this.className,
    this.type,
    this.externalNode,
    this.isActive,
    this.referenceId,
    this.trId,
    this.createdAt,
    this.isDeleted,
    this.supplier,
    this.canDelete,
    this.tag,
    this.key,
    this.updatedAt,
    this.canDisplay,
    this.structureName,
    this.count,
    this.setNumber,
    this.measurementUnit,
    this.tagNumber,
    this.name,
    this.partNumber,
    this.deletorId,
    this.category,
  });

  factory WorkSpaceMaterialProperties.fromJson(Map<String, dynamic> json) => _$WorkSpaceMaterialPropertiesFromJson(json);

  Map<String, dynamic> toJson() => _$WorkSpaceMaterialPropertiesToJson(this);

  @override
  List<Object?> get props => [
        referenceLabel,
        creatorId,
        description,
        className,
        type,
        externalNode,
        isActive,
        referenceId,
        trId,
        createdAt,
        isDeleted,
        supplier,
        canDelete,
        tag,
        key,
        updatedAt,
        canDisplay,
        structureName,
        count,
        setNumber,
        measurementUnit,
        tagNumber,
        name,
        partNumber,
        deletorId,
        category,
      ];
}
