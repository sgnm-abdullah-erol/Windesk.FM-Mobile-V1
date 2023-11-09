import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generator/work_space_created_by.g.dart';

@JsonSerializable()
class CreatedBy extends Equatable {
  final String? id;
  final List<String>? label;
  String? name;

  CreatedBy({
    this.id,
    this.label,
    this.name,
  });
  factory CreatedBy.fromJson(Map<String, dynamic> json) => _$CreatedByFromJson(json);

  @override
  List<Object?> get props => [
        id,
        label,
        name,
      ];
}
