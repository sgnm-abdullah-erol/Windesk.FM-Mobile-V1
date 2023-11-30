import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generator_work_order_scope_model/checklist_has_regulation_model.g.dart';

@JsonSerializable()
class CheckListHasRegulationModel extends Equatable {
    final String? name;
    final int? id;
    final String? description;
    final String? typename;


  const CheckListHasRegulationModel({
        this.name,
        this.id,
        this.description,
        this.typename,
  });

  factory CheckListHasRegulationModel.fromJson(Map<String, dynamic> json) => _$CheckListHasRegulationModelFromJson(json);


  static List<CheckListHasRegulationModel> fromJsonList(List<dynamic> json) {
    List<CheckListHasRegulationModel> checkListHasRegulationModel = [];

    for (var item in json) {
      checkListHasRegulationModel.add(CheckListHasRegulationModel.fromJson(item));
    }
    return checkListHasRegulationModel;
    }

  Map<String, dynamic> toJson() => _$CheckListHasRegulationModelToJson(this);

  @override
  List<Object?> get props => [
        name,
        id,
        description,
        typename,
      ];
}
