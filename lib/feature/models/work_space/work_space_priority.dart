import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'generator/work_space_priority.g.dart';

@JsonSerializable()
class Priority extends Equatable {
  final int? id;
  final List<String>? label;
  final String? name;

  const Priority({
    this.id,
    this.label,
    this.name,
  });

  factory Priority.fromJson(Map<String, dynamic> json) => _$PriorityFromJson(json);

  @override
  List<Object?> get props => [
        id,
        label,
        name,
      ];
}
