import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vm_fm_4/feature/models/work_order_scope_models/start_check_list_value_class_model.dart';

part 'generator_work_order_scope_model/start_check_list_value_model.g.dart';

@JsonSerializable()
class StartCheckListValueModel extends Equatable {
    final String? typename;
    final StartCheckListValueClassModel? startCheckListValue;


  const StartCheckListValueModel({
        this.typename,
        this.startCheckListValue,
  });

  factory StartCheckListValueModel.fromJson(Map<String, dynamic> json) => _$StartCheckListValueModelFromJson(json);


  static List<StartCheckListValueModel> fromJsonList(List<dynamic> json) {
    List<StartCheckListValueModel> startCheckListValueModel = [];
    for (var item in json) {
      startCheckListValueModel.add(StartCheckListValueModel.fromJson(item));
    }
    return startCheckListValueModel;
    }

  Map<String, dynamic> toJson() => _$StartCheckListValueModelToJson(this);

  @override
  List<Object?> get props => [
        typename,
        startCheckListValue,
      ];
}
