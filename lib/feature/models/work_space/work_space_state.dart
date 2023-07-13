import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'work_space_next_state.dart';

part 'generator/work_space_state.g.dart';

@JsonSerializable()
class State extends Equatable {
  final bool? isDefault;
  final bool? isDeleted;
  final String? name;
  final bool? canDelete;
  final bool? isActive;
  final String? key;
  final int? id;
  final List<String>? labels;
  final List<NextState>? nextStates;

  const State({
    this.isDefault,
    this.isDeleted,
    this.name,
    this.canDelete,
    this.isActive,
    this.key,
    this.id,
    this.labels,
    this.nextStates,
  });

  factory State.fromJson(Map<String, dynamic> json) => _$StateFromJson(json);

  @override
  List<Object?> get props => [
        isDefault,
        isDeleted,
        name,
        canDelete,
        isActive,
        key,
        id,
        labels,
        nextStates,
      ];
}
