import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vm_fm_4/feature/models/work_order_scope_models/check_list_status_connection_model.dart';

part 'generator_work_order_support_model/check_list_value_model.g.dart';

@JsonSerializable()
class CheckListValueModel extends Equatable {
    final int? id;
    final List<dynamic>? component;
    final List<dynamic>? facilityStructure;
    final List<dynamic>? system;
    final CheckListStatusConnectionModel? statusConnection;


  const CheckListValueModel({
        this.id,
        this.component,
        this.facilityStructure,
        this.system,
        this.statusConnection,
  });

  factory CheckListValueModel.fromJson(Map<String, dynamic> json) => _$CheckListValueModelFromJson(json);


  static List<CheckListValueModel> fromJsonList(List<dynamic> json) {
    List<CheckListValueModel> checkListValueModel = [];

    for (var item in json) {
      checkListValueModel.add(CheckListValueModel.fromJson(item));
    }
    return checkListValueModel;
    }

  Map<String, dynamic> toJson() => _$CheckListValueModelToJson(this);

  @override
  List<Object?> get props => [
        id,
        component,
        facilityStructure,
        system,
        statusConnection,
      ];
}
