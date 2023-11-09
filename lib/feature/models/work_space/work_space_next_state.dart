import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vm_fm_4/feature/models/work_space/work_space_user_groups.dart';

part 'generator/work_space_next_state.g.dart';

@JsonSerializable()
class NextState extends Equatable {
  final bool? canDisplay;
  final String? description;
  final String? className;
  final bool? isActive;
  final String? trId;
  final DateTime? createdAt;
  final bool? isDefault;
  final bool? isDeleted;
  final bool? isFinalState;
  final String? mainStateId;
  final String? name;
  final bool? canDelete;
  final List<dynamic>? tag;
  final String? key;
  final DateTime? updatedAt;
  final int? id;
  final List<String>? label;
  final List<WorkSpaceUserGroups>? userGroups;

  const NextState({
    this.canDisplay,
    this.description,
    this.className,
    this.isActive,
    this.trId,
    this.createdAt,
    this.isDefault,
    this.isDeleted,
    this.isFinalState,
    this.mainStateId,
    this.name,
    this.canDelete,
    this.tag,
    this.key,
    this.updatedAt,
    this.id,
    this.label,
    this.userGroups
  });

  factory NextState.fromJson(Map<String, dynamic> json) => _$NextStateFromJson(json);

  @override
  List<Object?> get props => [
        canDisplay,
        description,
        className,
        isActive,
        trId,
        createdAt,
        isDefault,
        isDeleted,
        isFinalState,
        mainStateId,
        name,
        canDelete,
        tag,
        key,
        updatedAt,
        id,
        label,
        userGroups
      ];
}
