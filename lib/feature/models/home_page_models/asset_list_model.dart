import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'asset_document_model.dart';
import 'asset_image_model.dart';

part 'generator/asset_list_model.g.dart';

@JsonSerializable()
class AssetListModel extends Equatable {
  final bool? canDisplay;
  final int? warrantyDurationParts;
  final String? installationDate;
  final String? description;
  final String? className;
  final String? assetIdentifier;
  final int? type;
  final bool? externalNode;
  final bool? isActive;
  final String? barCode;
  final String? trId;
  final String? serialNo;
  final String? tagNumber;
  final DateTime? createdAt;
  final String? warrantyStartDate;
  final bool? isDeleted;
  final String? name;
  final int? warrantyDurationLabor;
  final bool? canDelete;
  final int? id;
  final dynamic tag;
  final dynamic structure;
  final String? key;
  final DateTime? updatedAt;
  final String? createdBy;
  final String? structureName;
  final String? warrantyGuarantorLabor;
  final String? warrantyGuarantorParts;
  final String? warrantyDurationUnit;
  final List<AssetImageModel>? images;
  final List<AssetDocumentModel>? documents;

  factory AssetListModel.fromJson(Map<String, dynamic> json) => _$AssetListModelFromJson(json);

  Map<String, dynamic> toJson() => _$AssetListModelToJson(this);

  const AssetListModel(
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
