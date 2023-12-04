import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'start_check_list_value_model.g.dart';

@JsonSerializable()
class StartCheckListValueModel extends Equatable {
  final List<String>? labels;
  final int? id;

  const StartCheckListValueModel(this.labels, this.id);

  factory StartCheckListValueModel.fromJson(Map<String, dynamic> json) => _$StartCheckListValueModelFromJson(json);

  @override
  List<Object?> get props => [labels, id];
}
