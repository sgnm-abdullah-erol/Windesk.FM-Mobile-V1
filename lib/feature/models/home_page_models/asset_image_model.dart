import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'asset_image_model.g.dart';

@JsonSerializable()
class AssetImageModel extends Equatable {
  bool canDisplay;
  String description;
  bool main;
  String className;
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

  factory AssetImageModel.fromJson(Map<String, dynamic> json) => _$AssetImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$AssetImageModelToJson(this);

  AssetImageModel({
    required this.canDisplay,
    required this.description,
    required this.main,
    required this.className,
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
        main,
        className,
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
