import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generator_work_order_scope_model/includesof_check_item_model.g.dart';

@JsonSerializable()
class IncludesOfCheckItemModel extends Equatable {
    final int? id;
    final String? name;
    final String? inputType;
    final List<dynamic>? labels;
    final bool? photoRequired;
    final String? description;
    final bool? isRequired;
    final bool? documentRequired;


  const IncludesOfCheckItemModel({
        this.id,
        this.name,
        this.inputType,
        this.labels,
        this.photoRequired,
        this.description,
        this.isRequired,
        this.documentRequired,
  });

  factory IncludesOfCheckItemModel.fromJson(Map<String, dynamic> json) => _$IncludesOfCheckItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$IncludesOfCheckItemModelToJson(this);

  static List<IncludesOfCheckItemModel> fromJsonList(List<dynamic> json) {
    List<IncludesOfCheckItemModel> includesOfCheckItemModel = [];

    for (var item in json) {
      includesOfCheckItemModel.add(IncludesOfCheckItemModel.fromJson(item));
    }

    return includesOfCheckItemModel;
    }

  @override
  List<Object?> get props => [
        id,
        name,
        inputType,
        labels,
        photoRequired,
        description,
        isRequired,
        documentRequired,
      ];
}
