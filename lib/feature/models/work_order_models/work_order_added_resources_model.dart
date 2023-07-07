import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'generator_work_order/work_order_added_resources_model.g.dart';

@JsonSerializable()
class WorkOrderAddedResources extends Equatable {
  final String? fullname;
  final String? code;

  const WorkOrderAddedResources({
    this.fullname,
    this.code,
  });

  factory WorkOrderAddedResources.fromJson(Map<String, dynamic> json) => _$WorkOrderAddedResourcesFromJson(json);

  Map<String, dynamic> toJson() => _$WorkOrderAddedResourcesToJson(this);

  static List<WorkOrderAddedResources> fromJsonList(List<dynamic> jsonList) {
    List<WorkOrderAddedResources> items = [];
    for (var item in jsonList) {
      items.add(WorkOrderAddedResources.fromJson(item));
    }
    return items;
  }

  @override
  List<Object?> get props => [
        fullname,
        code,
      ];
}
