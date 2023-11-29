import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vm_fm_4/feature/models/work_order_scope_models/component_image_model.dart';

part 'generator_work_order_scope_model/component_properties_model.g.dart';

@JsonSerializable()
class ComponentPropertiesModel extends Equatable {
    final bool? canDisplay;
    final int? warrantyDurationParts;
    final DateTime? installationDate;
    final String? description;
    final String? className;
    final String? assetIdentifier;
    final int? type;
    final bool? externalNode;
    final bool? isActive;
    final String? parentId;
    final String? barCode;
    final String? serialNo;
    final String? trId;
    final String? tagNumber;
    final DateTime? createdAt;
    final DateTime? warrantyStartDate;
    final bool? isDeleted;
    final String? name;
    final int? warrantyDurationLabor;
    final bool? canDelete;
    final int? id;
    final List<dynamic>? tag;
    final String? key;
    final DateTime? updatedAt;
    final String? createdBy;
    final dynamic structure;
    final String? structureName;
    final String? warrantyGuarantorLabor;
    final String? warrantyGuarantorParts;
    final String? warrantyDurationUnit;
    final List<ComponentImageModel>? images;
    final List<dynamic>? documents;


  const ComponentPropertiesModel({
                this.canDisplay,
        this.warrantyDurationParts,
        this.installationDate,
        this.description,
        this.className,
        this.assetIdentifier,
        this.type,
        this.externalNode,
        this.isActive,
        this.parentId,
        this.barCode,
        this.serialNo,
        this.trId,
        this.tagNumber,
        this.createdAt,
        this.warrantyStartDate,
        this.isDeleted,
        this.name,
        this.warrantyDurationLabor,
        this.canDelete,
        this.id,
        this.tag,
        this.key,
        this.updatedAt,
        this.createdBy,
        this.structure,
        this.structureName,
        this.warrantyGuarantorLabor,
        this.warrantyGuarantorParts,
        this.warrantyDurationUnit,
        this.images,
        this.documents,
  });

  factory ComponentPropertiesModel.fromJson(Map<String, dynamic> json) => _$ComponentPropertiesModelFromJson(json);

  Map<String, dynamic> toJson() => _$ComponentPropertiesModelToJson(this);

  static List<ComponentPropertiesModel> fromJsonList(List<dynamic> json) {
    List<ComponentPropertiesModel> componentPropertiesModel = [];

    for (var item in json) {
      componentPropertiesModel.add(ComponentPropertiesModel.fromJson(item));
    }

    return componentPropertiesModel;
    }

  @override
  List<Object?> get props => [
      canDisplay,
      warrantyDurationParts,
      installationDate,
      description,
      className,
      assetIdentifier,
      type,
      externalNode,
      isActive,
      parentId,
      barCode,
      serialNo,
      trId,
      tagNumber,
      createdAt,
      warrantyStartDate,
      isDeleted,
      name,
      warrantyDurationLabor,
      canDelete,
      id,
      tag,
      key,
      updatedAt,
      createdBy,
      structure,
      structureName,
      warrantyGuarantorLabor,
      warrantyGuarantorParts,
      warrantyDurationUnit,
      images,
      documents,
      ];
}
