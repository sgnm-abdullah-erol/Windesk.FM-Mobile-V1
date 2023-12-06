import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vm_fm_4/feature/models/work_order_scope_models/check_list_value_model.dart';


part 'generator_work_order_scope_model/check_list_maintanence_model.g.dart';

@JsonSerializable()
class CheckListMaintanenceModel extends Equatable {
    final List<CheckListValueModel>? checkListValue;

  const CheckListMaintanenceModel({
        this.checkListValue,
  });

  factory CheckListMaintanenceModel.fromJson(Map<String, dynamic> json) => _$CheckListMaintanenceModelFromJson(json);


  static List<CheckListMaintanenceModel> fromJsonList(List<dynamic> json) {
    List<CheckListMaintanenceModel> checkListMaintanenceModel = [];

    for (var item in json) {
      checkListMaintanenceModel.add(CheckListMaintanenceModel.fromJson(item));
    }
    return checkListMaintanenceModel;
    }

  Map<String, dynamic> toJson() => _$CheckListMaintanenceModelToJson(this);

  @override
  List<Object?> get props => [
      checkListValue
      ];
}
