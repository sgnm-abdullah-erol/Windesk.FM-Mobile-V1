import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vm_fm_4/feature/models/work_space/work_space_note_value.dart';

part 'generator/work_space_note.g.dart';

@JsonSerializable()
class WorkSpaceNote extends Equatable {
  final int? id;
  final List<String>? label;
  final String? note;
  final WorkSpaceNoteValue? value;

  const WorkSpaceNote({
    this.id,
    this.label,
    this.note,
    this.value,
  });

  static List<WorkSpaceNote> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => WorkSpaceNote.fromJson(json)).toList();
  }

  factory WorkSpaceNote.fromJson(Map<String, dynamic> json) => _$WorkSpaceNoteFromJson(json);

  Map<String, dynamic> toJson() => _$WorkSpaceNoteToJson(this);

  @override
  List<Object?> get props => [
        id,
        label,
        note,
        value,
      ];
}
