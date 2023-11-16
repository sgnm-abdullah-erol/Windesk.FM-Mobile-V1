import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_group_model.g.dart';

@JsonSerializable()
class UserGroupModel extends Equatable {
  final int? id;
  final List<String>? labels;
  final String? name;

  const UserGroupModel({
    this.id,
    this.labels,
    this.name,
  });

  factory UserGroupModel.fromJson(Map<String, dynamic> json) => _$UserGroupModelFromJson(json);

  @override
  List<Object?> get props => [
        id,
        labels,
        name,
      ];
}
