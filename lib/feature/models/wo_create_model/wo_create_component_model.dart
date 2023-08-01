
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'generator_wo_create/wo_create_component_model.g.dart';

@JsonSerializable()
class WoCreateComponentModel extends Equatable{
    final bool? canDisplay;
    final int? warrantyDurationParts;
    final String? installationDate;
    final String? description;
    final String? className;
    final String? assetIdentifier;
    final int? type;
    final bool? externalNode;
    final bool? isActive;
    final String? trId;
    final String? serialNo;
    final String? barCode;
    final String? tagNumber;
    final DateTime? createdAt;
    final String? warrantyStartDate;
    final bool? isDeleted;
    final String? name;
    final int? warrantyDurationLabor;
    final bool? canDelete;
    final List<String>? tag;
    final int? id;
    final String? key;
    final DateTime? updatedAt;
    final dynamic structure;
    final String? warrantyGuarantorLabor;
    final String? warrantyGuarantorParts;
    final String? warrantyDurationUnit;
    final List<dynamic>? images;

    const WoCreateComponentModel({
        this.canDisplay,
        this.warrantyDurationParts,
        this.installationDate,
        this.description,
        this.className,
        this.assetIdentifier,
        this.type,
        this.externalNode,
        this.isActive,
        this.trId,
        this.serialNo,
        this.barCode,
        this.tagNumber,
        this.createdAt,
        this.warrantyStartDate,
        this.isDeleted,
        this.name,
        this.warrantyDurationLabor,
        this.canDelete,
        this.tag,
        this.id,
        this.key,
        this.updatedAt,
        this.structure,
        this.warrantyGuarantorLabor,
        this.warrantyGuarantorParts,
        this.warrantyDurationUnit,
        this.images,
    });

    factory WoCreateComponentModel.fromJson(Map<String, dynamic> json) => _$WoCreateComponentModelFromJson(json);


    static List<WoCreateComponentModel> fromJsonList(List<dynamic> json) {
    List<WoCreateComponentModel> requestByModel = [];

    for (var item in json) {
      requestByModel.add(WoCreateComponentModel.fromJson(item));
    }

    return requestByModel;
    }

    Map<String, dynamic> toJson() => _$WoCreateComponentModelToJson(this);

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
        trId,
        serialNo,
        barCode,
        tagNumber,
        createdAt,
        warrantyStartDate,
        isDeleted,
        name,
        warrantyDurationLabor,
        canDelete,
        tag,
        id,
        key,
        updatedAt,
        structure,
        warrantyGuarantorLabor,
        warrantyGuarantorParts,
        warrantyDurationUnit,
        images,
      ];

}