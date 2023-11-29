import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vm_fm_4/feature/models/work_order_scope_models/component_identity_model.dart';
import 'package:vm_fm_4/feature/models/work_order_scope_models/component_properties_model.dart';

part 'generator_work_order_scope_model/component_original_model.g.dart';

@JsonSerializable()
class ComponentOriginalModel extends Equatable {
    final ComponentIdentityModel? identity;
    final List<String>? labels;
    final ComponentPropertiesModel? properties;
    final String? elementId;


  const ComponentOriginalModel({
        this.identity,
        this.labels,
        this.properties,
        this.elementId,
  });

  factory ComponentOriginalModel.fromJson(Map<String, dynamic> json) => _$ComponentOriginalModelFromJson(json);


  static List<ComponentOriginalModel> fromJsonList(List<dynamic> json) {
    List<ComponentOriginalModel> componentOriginalModel = [];

    for (var item in json) {
      componentOriginalModel.add(ComponentOriginalModel.fromJson(item));
    }

    return componentOriginalModel;
    }

  Map<String, dynamic> toJson() => _$ComponentOriginalModelToJson(this);

  @override
  List<Object?> get props => [
       identity,
       labels,
       properties,
       elementId,
      ];
}
