import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vm_fm_4/feature/models/work_order_scope_models/check_list_node_model.dart';

part 'generator_work_order_scope_model/check_list_edge_model.g.dart';

@JsonSerializable()
class CheckListEdgeModel extends Equatable {
    final CheckListNodeModel? node;



  const CheckListEdgeModel({
        this.node,
  });

  factory CheckListEdgeModel.fromJson(Map<String, dynamic> json) => _$CheckListEdgeModelFromJson(json);


  static List<CheckListEdgeModel> fromJsonList(List<dynamic> json) {
    List<CheckListEdgeModel> checkListEdgeModel = [];

    for (var item in json) {
      checkListEdgeModel.add(CheckListEdgeModel.fromJson(item));
    }
    return checkListEdgeModel;
    }

  Map<String, dynamic> toJson() => _$CheckListEdgeModelToJson(this);

  @override
  List<Object?> get props => [
      node
      ];
}
