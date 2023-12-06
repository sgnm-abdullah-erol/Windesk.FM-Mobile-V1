import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vm_fm_4/feature/models/work_order_scope_models/component_original_model.dart';

part 'generator_work_order_scope_model/will_be_applied_to_component_model.g.dart';

@JsonSerializable()
class WillBeAppliedToComponentModel extends Equatable {
  final ComponentOriginalModel? componentOriginal;
  final int? id;

  const WillBeAppliedToComponentModel({
    this.componentOriginal,
    this.id,
  });

  factory WillBeAppliedToComponentModel.fromJson(Map<String, dynamic> json) => _$WillBeAppliedToComponentModelFromJson(json);

  static List<WillBeAppliedToComponentModel> fromJsonList(List<dynamic> json) {
    List<WillBeAppliedToComponentModel> willBeAppliedToComponentModel = [];

    for (var item in json) {
      willBeAppliedToComponentModel.add(WillBeAppliedToComponentModel.fromJson(item));
    }

    return willBeAppliedToComponentModel;
  }

  Map<String, dynamic> toJson() => _$WillBeAppliedToComponentModelToJson(this);

  @override
  List<Object?> get props => [
        componentOriginal,
        id
      ];
}
