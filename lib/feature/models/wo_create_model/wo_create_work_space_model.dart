import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vm_fm_4/feature/models/wo_create_model/wo_create_work_space_child_model.dart';

part 'generator_wo_create/wo_create_work_space_model.g.dart';

@JsonSerializable()
class WoCreateWorkSpaceModel extends Equatable {
    final bool? canDisplay;
    final bool? isDeleted;
    final String? name;
    final bool? canDelete;
    final bool? isActive;
    final String? key;
    final List<WoCreateWorkSpaceChildModel>? children;
    final int? totalCount;

  const WoCreateWorkSpaceModel({
        this.canDisplay,
        this.isDeleted,
        this.name,
        this.canDelete,
        this.isActive,
        this.key,
        this.children,
        this.totalCount,
  });
  factory WoCreateWorkSpaceModel.fromJson(Map<String, dynamic> json) => _$WoCreateWorkSpaceModelFromJson(json);

  Map<String, dynamic> toJson() => _$WoCreateWorkSpaceModelToJson(this);

  @override
  List<Object?> get props => [
      canDisplay,
      isDeleted,
      name,
      canDelete,
      isActive,
      key,
      children,
      totalCount,
      ];
}
