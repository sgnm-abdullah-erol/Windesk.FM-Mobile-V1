import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vm_fm_4/feature/models/work_space/child_location_structure.dart';
part 'main_location_structure.g.dart';

@JsonSerializable()
class MainLocationStructure extends Equatable {
  final bool? canDisplay;
  final String? description;
  final String? nodeType;
  final bool? isActive;
  final DateTime? createdAt;
  final bool? isDeleted;
  final String? createdBy;
  final String? name;
  final String? realm;
  final bool? canDelete;
  final List<dynamic>? tag;
  final String? key;
  final DateTime? updatedAt;
  final int? id;
  final bool? leaf;
  final List<ChildLocationStructure>? children;

  const MainLocationStructure({
    this.canDisplay,
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
    this.children,
  });

  // from json
  factory MainLocationStructure.fromJson(Map<String, dynamic> json) => _$MainLocationStructureFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$MainLocationStructureToJson(this);

  @override
  List<Object?> get props => [
        canDisplay,
        description,
        nodeType,
        isActive,
        createdAt,
        isDeleted,
        createdBy,
        name,
        realm,
        canDelete,
        tag,
        key,
        updatedAt,
        id,
        leaf,
        children,
      ];
}
