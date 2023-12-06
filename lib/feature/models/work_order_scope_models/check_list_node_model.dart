import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';


part 'generator_work_order_scope_model/check_list_node_model.g.dart';

@JsonSerializable()
class CheckListNodeModel extends Equatable {
    final String? code;



  const CheckListNodeModel({
        this.code,
  });

  factory CheckListNodeModel.fromJson(Map<String, dynamic> json) => _$CheckListNodeModelFromJson(json);


  static List<CheckListNodeModel> fromJsonList(List<dynamic> json) {
    List<CheckListNodeModel> checkListNodeModel = [];

    for (var item in json) {
      checkListNodeModel.add(CheckListNodeModel.fromJson(item));
    }
    return checkListNodeModel;
    }

  Map<String, dynamic> toJson() => _$CheckListNodeModelToJson(this);

  @override
  List<Object?> get props => [
      code
      ];
}
