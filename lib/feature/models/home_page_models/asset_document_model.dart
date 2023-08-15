// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generator/asset_document_model.g.dart';

@JsonSerializable()
class AssetDocumentModel extends Equatable {
  final bool? canDisplay;
  final String? description;
  final String? className;
  final String? type;
  final bool? isActive;
  final String? url;
  final DateTime? createdAt;
  final bool? isDeleted;
  final String? name;
  final bool? canDelete;
  final List<dynamic>? tag;
  final String? componentKey;
  final String? key;
  final DateTime? updatedAt;
  final int? id;

  factory AssetDocumentModel.fromJson(Map<String, dynamic> json) => _$AssetDocumentModelFromJson(json);

  Map<String, dynamic> toJson() => _$AssetDocumentModelToJson(this);

  const AssetDocumentModel({
    required this.canDisplay,
    required this.description,
    required this.className,
    required this.type,
    required this.isActive,
    required this.url,
    required this.createdAt,
    required this.isDeleted,
    required this.name,
    required this.canDelete,
    required this.tag,
    required this.componentKey,
    required this.key,
    required this.updatedAt,
    required this.id,
  });

  @override
  List<Object?> get props => [
        canDisplay,
        description,
        className,
        type,
        isActive,
        url,
        createdAt,
        isDeleted,
        name,
        canDelete,
        tag,
        componentKey,
        key,
        updatedAt,
        id,
      ];
}
