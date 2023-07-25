

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'wo_create_location_children.g.dart';

@JsonSerializable()
class WoCreateLocationChildrenModel extends Equatable{
  final List<String>? labels;
  final String? contractor;
  final String? code;
  final String? externalSiteObject;
  final String? warrantyExpireDate;
  final String? externalFacilityObject;
  final String? description;
  final String? siteName;
  final bool? isActive;
  final String? operator;
  final String? handoverDate;
  final String? createdAt;
  final bool? isDeleted;
  final String? operationStartDate;
  final String? externalIdentifier;
  final bool? canDelete;
  final List<String>? tag;
  final String? externalFacilityIdentifier;
  final String? key;
  final String? owner;
  final String? phase;
  final bool? canDisplay;
  final String? address;
  final String? siteDescription;
  final String? areaMeasurement;
  final String? nodeType;
  final String? externalSystem;
  final String? externalObject;
  final String? name;
  final String? projectDescription;
  final String? projectName;
  final String? externalSiteIdentifier;
  final String? status;
  final int? id;
  final bool? leaf;

  const  WoCreateLocationChildrenModel(
      {this.labels,
      this.contractor,
      this.code,
      this.externalSiteObject,
      this.warrantyExpireDate,
      this.externalFacilityObject,
      this.description,
      this.siteName,
      this.isActive,
      this.operator,
      this.handoverDate,
      this.createdAt,
      this.isDeleted,
      this.operationStartDate,
      this.externalIdentifier,
      this.canDelete,
      this.tag,
      this.externalFacilityIdentifier,
      this.key,
      this.owner,
      this.phase,
      this.canDisplay,
      this.address,
      this.siteDescription,
      this.areaMeasurement,
      this.nodeType,
      this.externalSystem,
      this.externalObject,
      this.name,
      this.projectDescription,
      this.projectName,
      this.externalSiteIdentifier,
      this.status,
      this.id,
      this.leaf});

  factory WoCreateLocationChildrenModel.fromJson(Map<String, dynamic> json) => _$WoCreateLocationChildrenModelFromJson(json);

  Map<String, dynamic> toJson() => _$WoCreateLocationChildrenModelToJson(this);

      
  @override
  List<Object?> get props => [
      labels,
      contractor,
      code,
      externalSiteObject,
      warrantyExpireDate,
      externalFacilityObject,
      description,
      siteName,
      isActive,
      operator,
      handoverDate,
      createdAt,
      isDeleted,
      operationStartDate,
      externalIdentifier,
      canDelete,
      tag,
      externalFacilityIdentifier,
      key,
      owner,
      phase,
      canDisplay,
      address,
      siteDescription,
      areaMeasurement,
      nodeType,
      externalSystem,
      externalObject,
      name,
      projectDescription,
      projectName,
      externalSiteIdentifier,
      status,
      id,
      leaf
      ];
}