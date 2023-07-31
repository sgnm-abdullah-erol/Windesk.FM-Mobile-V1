import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';


part 'generator_wo_create/wo_create_requestedtype_model.g.dart';

@JsonSerializable()
class WoCreateRequestedTypeModel extends Equatable{
    final String? owner;
    final bool? canDisplay;
    final String? code;
    final String? type;
    final String? language;
    final bool? isActive;
    final String? trId;
    final DateTime? createdAt;
    final bool? parentOfIsDeleted;
    final bool? isDeleted;
    final String? name;
    final bool? canDelete;
    final dynamic? id;
    final String? key;
    final DateTime? updatedAt;
    final List<WoCreateRequestedTypeModel>? children;

    const WoCreateRequestedTypeModel({
        this.owner,
        this.canDisplay,
        this.code,
        this.type,
        this.language,
        this.isActive,
        this.trId,
        this.createdAt,
        this.parentOfIsDeleted,
        this.isDeleted,
        this.name,
        this.canDelete,
        this.id,
        this.key,
        this.updatedAt,
        this.children,
    });

    factory WoCreateRequestedTypeModel.fromJson(Map<String, dynamic> json) => _$WoCreateRequestedTypeModelFromJson(json);

    Map<String, dynamic> toJson() => _$WoCreateRequestedTypeModelToJson(this);

    @override
    List<Object?> get props => [
        owner,
        canDisplay,
        code,
        type,
        language,
        isActive,
        trId,
        createdAt,
        parentOfIsDeleted,
        isDeleted,
        name,
        canDelete,
        id,
        key,
        updatedAt,
        children,
      ];

}