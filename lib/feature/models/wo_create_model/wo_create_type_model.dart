import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generator_wo_create/wo_create_type_model.g.dart';

@JsonSerializable()
class WoCreateTypeModel extends Equatable {
  final String? owner;
  final bool? canDisplay;
  final String? code;
  final String? language;
  final String? type;
  final bool? isActive;
  final String? trId;
  final DateTime? createdAt;
  final bool? isDeleted;
  final String? name;
  final bool? canDelete;
  final String? key;
  final DateTime? updatedAt;
  final int? id;
  final List<String>? labels;

  const WoCreateTypeModel({
    this.owner,
    this.canDisplay,
    this.code,
    this.language,
    this.type,
    this.isActive,
    this.trId,
    this.createdAt,
    this.isDeleted,
    this.name,
    this.canDelete,
    this.key,
    this.updatedAt,
    this.id,
    this.labels,
  });

  factory WoCreateTypeModel.fromJson(Map<String, dynamic> json) => _$WoCreateTypeModelFromJson(json);

  static List<WoCreateTypeModel> fromJsonList(List<dynamic> json) {
    List<WoCreateTypeModel> requestByModel = [];

    for (var item in json) {
      requestByModel.add(WoCreateTypeModel.fromJson(item));
    }

    return requestByModel;
  }

  Map<String, dynamic> toJson() => _$WoCreateTypeModelToJson(this);

  @override
  List<Object?> get props => [
        owner,
        canDisplay,
        code,
        language,
        type,
        isActive,
        trId,
        createdAt,
        isDeleted,
        name,
        canDelete,
        key,
        updatedAt,
        id,
        labels,
      ];
}
