import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_check_item_value_model.g.dart';

@JsonSerializable()
class CreateCheckItemValue extends Equatable {
  final int? id;
  final String? key;

  const CreateCheckItemValue(this.id, this.key);

  factory CreateCheckItemValue.fromJson(Map<String, dynamic> json) => _$CreateCheckItemValueFromJson(json);

  @override
  List<Object?> get props => [id, key];
}
