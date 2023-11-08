import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generator/work_space_user_groups.g.dart';

@JsonSerializable()
class WorkSpaceUserGroups extends Equatable {
  final int? id;
  final List<String>? labels;
  final String? name;

  const WorkSpaceUserGroups({
    this.id,
    this.labels,
    this.name,
  });
  factory WorkSpaceUserGroups.fromJson(Map<String, dynamic> json) => _$WorkSpaceUserGroupsFromJson(json);

  @override
  List<Object?> get props => [
        id,
        labels,
        name,
      ];
}
