import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'generator_work_order/work_order_resources.g.dart';

@JsonSerializable()
class WorkOrderResources extends Equatable {
  final String? module;
  final String? modulecode;
  final String? name;
  final String? vardiya;

  const WorkOrderResources({
    this.module,
    this.modulecode,
    this.name,
    this.vardiya,
  });

  factory WorkOrderResources.fromJson(Map<String, dynamic> json) => _$WorkOrderResourcesFromJson(json);

  Map<String, dynamic> toJson() => _$WorkOrderResourcesToJson(this);

  @override
  List<Object?> get props => [
        module,
        modulecode,
        name,
        vardiya,
      ];
}
