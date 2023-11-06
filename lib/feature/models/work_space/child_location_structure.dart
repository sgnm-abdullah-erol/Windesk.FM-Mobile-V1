import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'child_location_structure.g.dart';

@JsonSerializable()
class ChildLocationStructure extends Equatable {
  final List<String>? labels;
  final String? owner;
  final String? contractor;
  final String? phase;
  final bool? canDisplay;
  final String? address;
  final int? warrantyExpireDate;
  final String? description;
  final String? siteName;
  final String? siteDescription;
  final int? areaMeasurement;
  final String? nodeType;
  final bool? isActive;
  final String? childOperator;
  final int? handoverDate;
  final DateTime? createdAt;
  final bool? isDeleted;
  final int? operationStartDate;
  final String? name;
  final String? projectDescription;
  final bool? canDelete;
  final List<dynamic>? tag;
  final String? projectName;
  final String? key;
  final int? id;
  final bool? leaf;

  // fromjsoon
  factory ChildLocationStructure.fromJson(Map<String, dynamic> json) => _$ChildLocationStructureFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$ChildLocationStructureToJson(this);

  // json list
  static List<ChildLocationStructure> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => ChildLocationStructure.fromJson(json)).toList();
  }

  const ChildLocationStructure({
    this.labels,
    this.owner,
    this.contractor,
    this.phase,
    this.canDisplay,
    this.address,
    this.warrantyExpireDate,
    this.description,
    this.siteName,
    this.siteDescription,
    this.areaMeasurement,
    this.nodeType,
    this.isActive,
    this.childOperator,
    this.handoverDate,
    this.createdAt,
    this.isDeleted,
    this.operationStartDate,
    this.name,
    this.projectDescription,
    this.canDelete,
    this.tag,
    this.projectName,
    this.key,
    this.id,
    this.leaf,
  });

  @override
  List<Object?> get props => [
        labels,
        owner,
        contractor,
        phase,
        canDisplay,
        address,
        warrantyExpireDate,
        description,
        siteName,
        siteDescription,
        areaMeasurement,
        nodeType,
        isActive,
        childOperator,
        handoverDate,
        createdAt,
        isDeleted,
        operationStartDate,
        name,
        projectDescription,
        canDelete,
        tag,
        projectName,
        key,
        id,
        leaf,
      ];
}
