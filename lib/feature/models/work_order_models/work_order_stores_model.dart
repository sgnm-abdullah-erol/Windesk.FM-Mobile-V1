import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generator_work_order/work_order_stores_model.g.dart';

@JsonSerializable()
class WorkOrderStores extends Equatable {
  final String? name;
  final String? code;

  const WorkOrderStores({
    this.name,
    this.code,
  });

  factory WorkOrderStores.fromJson(Map<String, dynamic> json) => _$WorkOrderStoresFromJson(json);

  Map<String, dynamic> toJson() => _$WorkOrderStoresToJson(this);

  static List<WorkOrderStores> fromJsonList(List<dynamic> jsonList) {
    List<WorkOrderStores> items = [];
    for (var item in jsonList) {
      items.add(WorkOrderStores.fromJson(item));
    }
    return items;
  }

  @override
  List<Object?> get props => [
        name,
        code,
      ];
}
