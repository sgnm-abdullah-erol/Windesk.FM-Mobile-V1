import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generator/asset_document_model.g.dart';

@JsonSerializable()
class AssetDocumentModel extends Equatable{
    bool canDisplay;
    String description;
    String className;
    String type;
    bool isActive;
    String url;
    DateTime createdAt;
    bool isDeleted;
    String name;
    bool canDelete;
    List<dynamic> tag;
    String componentKey;
    String key;
    DateTime updatedAt;
    int id;

    factory AssetDocumentModel.fromJson(Map<String, dynamic> json) => _$AssetDocumentModelFromJson(json);

    Map<String, dynamic> toJson() => _$AssetDocumentModelToJson(this);

    AssetDocumentModel({
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