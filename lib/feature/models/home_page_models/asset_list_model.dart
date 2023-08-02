import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vm_fm_4/feature/models/home_page_models/asset_image_model.dart';

part 'generator/asset_list_model.g.dart';

@JsonSerializable()
class AssetListModel extends Equatable {
  bool? canDisplay;
  int? warrantyDurationParts;
  String? installationDate;
  String? description;
  String? className;
  String? assetIdentifier;
  int? type;
  bool? externalNode;
  bool? isActive;
  String? barCode;
  String? trId;
  String? serialNo;
  String? tagNumber;
  DateTime? createdAt;
  String? warrantyStartDate;
  bool? isDeleted;
  String? name;
  int? warrantyDurationLabor;
  bool? canDelete;
  int? id;
  dynamic tag;
  dynamic structure;
  String? key;
  DateTime? updatedAt;
  String? createdBy;
  String? structureName;
  String? warrantyGuarantorLabor;
  String? warrantyGuarantorParts;
  String? warrantyDurationUnit;
  List<AssetImageModel>? images;
  dynamic documents;

  factory AssetListModel.fromJson(Map<String, dynamic> json) => _$AssetListModelFromJson(json);

  Map<String, dynamic> toJson() => _$AssetListModelToJson(this);

  AssetListModel(
      {this.canDisplay,
      this.warrantyDurationParts,
      this.installationDate,
      this.description,
      this.className,
      this.assetIdentifier,
      this.type,
      this.externalNode,
      this.isActive,
      this.barCode,
      this.trId,
      this.serialNo,
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
      this.structureName,
      this.warrantyGuarantorLabor,
      this.warrantyGuarantorParts,
      this.warrantyDurationUnit,
      this.images,
      this.structure,
      this.documents});

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
        barCode,
        trId,
        serialNo,
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
        structureName,
        warrantyGuarantorLabor,
        warrantyGuarantorParts,
        warrantyDurationUnit,
        structure,
        documents
      ];
}
