import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'work_space_next_state.dart';

part 'generator/work_space_current_state.g.dart';

@JsonSerializable()
class CurrentState extends Equatable {
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
  final List<String>? labels;
  final List<NextState>? nextStates;
  final List<NextState>? rejectStates;

  const CurrentState({
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
    this.labels,
    this.nextStates,
    this.rejectStates
  });

  factory CurrentState.fromJson(Map<String, dynamic> json) => _$CurrentStateFromJson(json);

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
      labels,
      nextStates,
      rejectStates
      ];
}
