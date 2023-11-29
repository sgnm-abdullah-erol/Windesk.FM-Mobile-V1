import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generator_work_order_scope_model/component_image_model.g.dart';

@JsonSerializable()
class ComponentImageModel extends Equatable {
    final DateTime? createdAt;
    final bool? canDisplay;
    final bool? isDeleted;
    final String? name;
    final bool? main;
    final String? className;
    final bool? canDelete;
    final bool? isActive;
    final String? componentKey;
    final String? url;
    final String? key;
    final DateTime? updatedAt;
    final int? id;


  const ComponentImageModel({
        this.createdAt,
        this.canDisplay,
        this.isDeleted,
        this.name,
        this.main,
        this.className,
        this.canDelete,
        this.isActive,
        this.componentKey,
        this.url,
        this.key,
        this.updatedAt,
        this.id,
  });

  factory ComponentImageModel.fromJson(Map<String, dynamic> json) => _$ComponentImageModelFromJson(json);


  static List<ComponentImageModel> fromJsonList(List<dynamic> json) {
    List<ComponentImageModel> componentImageModel = [];

    for (var item in json) {
      componentImageModel.add(ComponentImageModel.fromJson(item));
    }

    return componentImageModel;
    }

  Map<String, dynamic> toJson() => _$ComponentImageModelToJson(this);

  @override
  List<Object?> get props => [
        createdAt,
        canDisplay,
        isDeleted,
        name,
        main,
        className,
        canDelete,
        isActive,
        componentKey,
        url,
        key,
        updatedAt,
        id,
      ];
}
