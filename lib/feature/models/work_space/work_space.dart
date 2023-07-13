import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generator/work_space.g.dart';

@JsonSerializable()
class Workspace extends Equatable {
  final String? owner;
  final DateTime? createdAt;
  final bool? canDisplay;
  final bool? isDeleted;
  final bool? isArchived;
  final String? name;
  final bool? canDelete;
  final List<dynamic>? tag;
  final List<int>? workflows;
  final bool? isActive;
  final String? key;
  final DateTime? updatedAt;
  final int? id;
  final List<String>? labels;

  const Workspace({
    this.owner,
    this.createdAt,
    this.canDisplay,
    this.isDeleted,
    this.isArchived,
    this.name,
    this.canDelete,
    this.tag,
    this.workflows,
    this.isActive,
    this.key,
    this.updatedAt,
    this.id,
    this.labels,
  });

  factory Workspace.fromJson(Map<String, dynamic> json) => _$WorkspaceFromJson(json);

  @override
  List<Object?> get props => [
        owner,
        createdAt,
        canDisplay,
        isDeleted,
        isArchived,
        name,
        canDelete,
        tag,
        workflows,
        isActive,
        key,
        updatedAt,
        id,
        labels,
      ];
}
