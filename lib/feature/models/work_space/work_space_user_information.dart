import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generator/work_space_user_information.g.dart';

@JsonSerializable()
class WorkSpaceUserInformation extends Equatable {
  final DateTime? createdAt;
  final String? urlType;
  final bool? isDeleted;
  final List<String>? referenceLabel;
  final String? name;
  final bool? canDelete;
  final String? url;
  final String? referenceId;
  final String? key;
  final DateTime? updatedAt;

  const WorkSpaceUserInformation({
    this.createdAt,
    this.urlType,
    this.isDeleted,
    this.referenceLabel,
    this.name,
    this.canDelete,
    this.url,
    this.referenceId,
    this.key,
    this.updatedAt,
  });

  factory WorkSpaceUserInformation.fromJson(Map<String, dynamic> json) => _$WorkSpaceUserInformationFromJson(json);

  Map<String, dynamic> toJson() => _$WorkSpaceUserInformationToJson(this);

  @override
  List<Object?> get props => [
        createdAt,
        urlType,
        isDeleted,
        referenceLabel,
        name,
        canDelete,
        url,
        referenceId,
        key,
        updatedAt,
      ];
}
