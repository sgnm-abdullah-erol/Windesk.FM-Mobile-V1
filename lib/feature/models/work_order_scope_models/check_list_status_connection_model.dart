import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vm_fm_4/feature/models/work_order_scope_models/check_list_edge_model.dart';

part 'generator_work_order_scope_model/check_list_status_connection_model.g.dart';

@JsonSerializable()
class CheckListStatusConnectionModel extends Equatable {
    final List<CheckListEdgeModel>? edges;



  const CheckListStatusConnectionModel({
        this.edges,
  });

  factory CheckListStatusConnectionModel.fromJson(Map<String, dynamic> json) => _$CheckListStatusConnectionModelFromJson(json);


  static List<CheckListStatusConnectionModel> fromJsonList(List<dynamic> json) {
    List<CheckListStatusConnectionModel> checkListStatusConnectionModel = [];

    for (var item in json) {
      checkListStatusConnectionModel.add(CheckListStatusConnectionModel.fromJson(item));
    }
    return checkListStatusConnectionModel;
    }

  Map<String, dynamic> toJson() => _$CheckListStatusConnectionModelToJson(this);

  @override
  List<Object?> get props => [
      edges
      ];
}
