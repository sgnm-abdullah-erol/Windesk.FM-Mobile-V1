import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generator_wo_create/wo_create_default_ws_user.g.dart';

@JsonSerializable()
class WoCreateDefaultWsUser extends Equatable {
    final String? owner;
    final bool? canDisplay;
    final bool? isArchived;
    final String? timezone;
    final List<int>? workflows;
    final bool? isActive;
    final DateTime? createdAt;
    final bool? isDeleted;
    final String? name;
    final bool? canDelete;
    final List<dynamic>? tag;
    final String? key;
    final DateTime? updatedAt;
    final int? id;
    final List<String>? labels;

  const WoCreateDefaultWsUser({
        this.owner,
        this.canDisplay,
        this.isArchived,
        this.timezone,
        this.workflows,
        this.isActive,
        this.createdAt,
        this.isDeleted,
        this.name,
        this.canDelete,
        this.tag,
        this.key,
        this.updatedAt,
        this.id,
        this.labels,
  });
  factory WoCreateDefaultWsUser.fromJson(Map<String, dynamic> json) => _$WoCreateDefaultWsUserFromJson(json);

  Map<String, dynamic> toJson() => _$WoCreateDefaultWsUserToJson(this);

  @override
  List<Object?> get props => [
        owner,
        canDisplay,
        isArchived,
        timezone,
        workflows,
        isActive,
        createdAt,
        isDeleted,
        name,
        canDelete,
        tag,
        key,
        updatedAt,
        id,
        labels,
      ];
}
