import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'start_check_list_value_model.g.dart';

@JsonSerializable()
class StartCheckListValueModel extends Equatable {
  final List<String>? labels;
  final int? id;
  final String? key;

  const StartCheckListValueModel(this.labels, this.id, this.key);

  factory StartCheckListValueModel.fromJson(Map<String, dynamic> json) => _$StartCheckListValueModelFromJson(json);

  @override
  List<Object?> get props => [labels, id, key];
}
