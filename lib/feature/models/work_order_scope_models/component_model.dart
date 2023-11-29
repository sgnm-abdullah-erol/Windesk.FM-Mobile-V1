import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vm_fm_4/feature/models/work_order_scope_models/will_be_applied_to_component_model.dart';

part 'generator_work_order_scope_model/component_model.g.dart';

@JsonSerializable()
class ComponentModel extends Equatable {
    final List<WillBeAppliedToComponentModel>? willBeAppliedToComponents;


  const ComponentModel({
        this.willBeAppliedToComponents,
  });

  factory ComponentModel.fromJson(Map<String, dynamic> json) => _$ComponentModelFromJson(json);

  Map<String, dynamic> toJson() => _$ComponentModelToJson(this);

  static List<ComponentModel> fromJsonList(List<dynamic> json) {
    List<ComponentModel> componentModel = [];
    for (var item in json) {
      componentModel.add(ComponentModel.fromJson(item));
    }
    return componentModel;
  }

  @override
  List<Object?> get props => [
        willBeAppliedToComponents,
      ];
}
