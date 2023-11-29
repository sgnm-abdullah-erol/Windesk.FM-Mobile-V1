import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generator_work_order_scope_model/component_model.g.dart';

@JsonSerializable()
class ComponentModel extends Equatable {
    final List<dynamic>? willBeAppliedToComponents;


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
