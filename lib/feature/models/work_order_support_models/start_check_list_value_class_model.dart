import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generator_work_order_support_model/start_check_list_value_class_model.g.dart';

@JsonSerializable()
class StartCheckListValueClassModel extends Equatable {
  final String? typename;
  final int? id;
  final List<String>? labels;

  const StartCheckListValueClassModel({
    this.typename,
    this.id,
    this.labels,
  });

  factory StartCheckListValueClassModel.fromJson(Map<String, dynamic> json) =>
      _$StartCheckListValueClassModelFromJson(json);

  static List<StartCheckListValueClassModel> fromJsonList(List<dynamic> json) {
    List<StartCheckListValueClassModel> startCheckListValueClassModel = [];
    for (var item in json) {
      startCheckListValueClassModel
          .add(StartCheckListValueClassModel.fromJson(item));
    }
    return startCheckListValueClassModel;
  }

  Map<String, dynamic> toJson() => _$StartCheckListValueClassModelToJson(this);

  @override
  List<Object?> get props => [
        typename,
        id,
        labels,
      ];
}
