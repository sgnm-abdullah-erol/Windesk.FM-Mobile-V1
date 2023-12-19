import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generator_work_order_support_model/component_identity_model.g.dart';

@JsonSerializable()
class ComponentIdentityModel extends Equatable {
  final int? low;
  final int? high;

  const ComponentIdentityModel({
    this.low,
    this.high,
  });

  factory ComponentIdentityModel.fromJson(Map<String, dynamic> json) =>
      _$ComponentIdentityModelFromJson(json);

  Map<String, dynamic> toJson() => _$ComponentIdentityModelToJson(this);

  @override
  List<Object?> get props => [
        low,
        high,
      ];
}
