import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generator_wo_create/wo_create_work_space_child_model.g.dart';

@JsonSerializable()
class WoCreateWorkSpaceChildModel extends Equatable {
    final bool? canDisplay;
    final DateTime? createdAt;
    final bool? childDefault;
    final bool? isDeleted;
    final String? name;
    final String? description;
    final String? className;
    final bool? canDelete;
    final List<dynamic>? tag;
    final bool? isActive;
    final String? key;
    final DateTime? updatedAt;
    final int? id;
    final List<String>? labels;
  
  const WoCreateWorkSpaceChildModel({
        this.canDisplay,
        this.createdAt,
        this.childDefault,
        this.isDeleted,
        this.name,
        this.description,
        this.className,
        this.canDelete,
        this.tag,
        this.isActive,
        this.key,
        this.updatedAt,
        this.id,
        this.labels,
  });
  factory WoCreateWorkSpaceChildModel.fromJson(Map<String, dynamic> json) => _$WoCreateWorkSpaceChildModelFromJson(json);

  Map<String, dynamic> toJson() => _$WoCreateWorkSpaceChildModelToJson(this);

  @override
  List<Object?> get props => [
      canDisplay,
      createdAt,
      childDefault,
      isDeleted,
      name,
      description,
      className,
      canDelete,
      tag,
      isActive,
      key,
      updatedAt,
      id,
      labels,
      ];
}
