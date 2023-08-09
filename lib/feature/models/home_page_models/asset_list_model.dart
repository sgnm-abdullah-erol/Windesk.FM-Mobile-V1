// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'asset_document_model.dart';
import 'asset_image_model.dart';

part 'generator/asset_list_model.g.dart';

@JsonSerializable()
class AssetListModel extends Equatable {
  bool? canDisplay;
  int? warrantyDurationParts;
  String? installationDate;
  String? description;
  String? className;
  dynamic assetIdentifier;
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
  dynamic createdBy;
  dynamic warrantyGuarantorLabor;
  dynamic warrantyGuarantorParts;
  dynamic warrantyDurationUnit;
  List<AssetImageModel>? images;
  List<AssetDocumentModel>? documents;

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
        warrantyGuarantorLabor,
        warrantyGuarantorParts,
        warrantyDurationUnit,
        structure,
        documents
      ];
}
