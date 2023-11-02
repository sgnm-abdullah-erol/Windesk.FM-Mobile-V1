import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generator/work_space_note_value.g.dart';

@JsonSerializable()
class WorkSpaceNoteValue extends Equatable {
  final DateTime? noteDate;
  final String? user;

  const WorkSpaceNoteValue({
    this.noteDate,
    this.user,
  });

  factory WorkSpaceNoteValue.fromJson(Map<String, dynamic> json) => _$WorkSpaceNoteValueFromJson(json);

  Map<String, dynamic> toJson() => _$WorkSpaceNoteValueToJson(this);

  @override
  List<Object?> get props => [
        noteDate,
        user,
      ];
}
