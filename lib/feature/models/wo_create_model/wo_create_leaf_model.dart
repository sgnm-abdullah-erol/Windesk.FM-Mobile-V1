import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vm_fm_4/feature/models/wo_create_model/wo_create_leaf_children_model.dart';

part 'generator_wo_create/wo_create_leaf_model.g.dart';

@JsonSerializable()
class WoCreateLeafModel extends Equatable {
  final String? contractor;
  final String? code;
  final String? externalSiteObject;
  final String? warrantyExpireDate;
  final String? externalFacilityObject;
  final String? description;
  final String? siteName;
  final bool? isActive;
  final String? temperaturesOperator;
  final String? handoverDate;
  final DateTime? createdAt;
  final bool? isDeleted;
  final String? operationStartDate;
  final String? externalIdentifier;
  final bool? canDelete;
  final List<dynamic>? tag;
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
  final List<WoCreateLeafChildrenModel>? children;

  const WoCreateLeafModel({
    this.contractor,
    this.code,
    this.externalSiteObject,
    this.warrantyExpireDate,
    this.externalFacilityObject,
    this.description,
    this.siteName,
    this.isActive,
    this.temperaturesOperator,
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
    this.leaf,
    this.children,
  });

  factory WoCreateLeafModel.fromJson(Map<String, dynamic> json) => _$WoCreateLeafModelFromJson(json);

  Map<String, dynamic> toJson() => _$WoCreateLeafModelToJson(this);

  @override
  List<Object?> get props => [
        contractor,
        code,
        externalSiteObject,
        warrantyExpireDate,
        externalFacilityObject,
        description,
        siteName,
        isActive,
        temperaturesOperator,
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
        leaf,
        children,
      ];
}
