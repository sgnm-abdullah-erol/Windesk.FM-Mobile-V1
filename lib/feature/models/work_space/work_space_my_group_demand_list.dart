import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generator/work_space_my_group_demand_list.g.dart';

@JsonSerializable()
class WorkSpaceMyGroupDemandList extends Equatable {
  final int? id;
  final String? name;
  final int? taskCount;
  final List<WorkSpaceMyGroupDemandList>? children;

  const WorkSpaceMyGroupDemandList({
    this.id,
    this.name,
    this.taskCount,
    this.children,
  });

  factory WorkSpaceMyGroupDemandList.fromJson(Map<String, dynamic> json) => _$MyGroupDemandListFromJson(json);

  Map<String, dynamic> toJson() => _$MyGroupDemandListToJson(this);

  @override
  List<Object?> get props => [
        id,
        name,
        taskCount,
        children,
      ];
}
