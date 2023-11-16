import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vm_fm_4/feature/models/reject_state_models/user_group_model.dart';

part 'reject_state_model.g.dart';

@JsonSerializable()
class RejectStateModel extends Equatable {
  final bool? isDefault;
  final bool? isDeleted;
  final String? name;
  final bool? canDelete;
  final bool? isActive;
  final String? key;
  final int? id;
  final List<String>? label;
  final List<UserGroupModel>? userGroups;

  const RejectStateModel({
    this.isDefault,
    this.isDeleted,
    this.name,
    this.canDelete,
    this.isActive,
    this.key,
    this.id,
    this.label,
    this.userGroups,
  });

  factory RejectStateModel.fromJson(Map<String, dynamic> json) => _$RejectStateModelFromJson(json);

  // from json list map
  static List<RejectStateModel> fromJsonList(List<dynamic> json) {
    return json.map((e) => RejectStateModel.fromJson(e)).toList();
  }

  @override
  List<Object?> get props => [
        isDefault,
        isDeleted,
        name,
        canDelete,
        isActive,
        key,
        id,
        label,
        userGroups,
      ];
}
