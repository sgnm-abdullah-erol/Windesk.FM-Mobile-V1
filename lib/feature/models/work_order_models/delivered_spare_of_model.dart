import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'delivered_spare_of_model.g.dart';

@JsonSerializable()
class DeliveredSpareOfModel extends Equatable {
  final dynamic id;
  final List<String>? label;
  final String? name;
  final dynamic amount;
  final dynamic measurementUnit;
  final String? user;
  final dynamic totalAmount;
  final String? materialDeliveredDate;

  const DeliveredSpareOfModel({
    this.id,
    this.label,
    this.name,
    this.amount,
    this.measurementUnit,
    this.user,
    this.totalAmount,
    this.materialDeliveredDate,
  });

  // json
  factory DeliveredSpareOfModel.fromJson(Map<String, dynamic> json) => _$DeliveredSpareOfModelFromJson(json);

  // list json
  static List<DeliveredSpareOfModel> fromJsonList(List<dynamic> jsonList) => jsonList.map((e) => DeliveredSpareOfModel.fromJson(e)).toList();

  @override
  List<Object?> get props => [
        id,
        label,
        name,
        amount,
        measurementUnit,
        user,
        totalAmount,
        materialDeliveredDate,
      ];
}
