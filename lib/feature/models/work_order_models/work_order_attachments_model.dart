import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generator_work_order/work_order_attachments_model.g.dart';

@JsonSerializable()
class WorkOrderAttachmentsModel extends Equatable {
  final int? id;
  final String? name;
  final String? filename;
  final String? dispfilename;
  final String? atchtype;
  final String? filepath;
  final String? idate;

  const WorkOrderAttachmentsModel({
    this.id,
    this.name,
    this.filename,
    this.dispfilename,
    this.atchtype,
    this.filepath,
    this.idate,
  });

  factory WorkOrderAttachmentsModel.fromJson(Map<String, dynamic> json) => _$WorkOrderAttachmentsModelFromJson(json);

  List<WorkOrderAttachmentsModel> fromJsonList(List<dynamic> json) {
    List<WorkOrderAttachmentsModel> workOrderLoads = [];

    for (var item in json) {
      workOrderLoads.add(WorkOrderAttachmentsModel.fromJson(item));
    }

    return workOrderLoads;
  }

  Map<String, dynamic> toJson() => _$WorkOrderAttachmentsModelToJson(this);

  @override
  List<Object?> get props => [
        id,
        name,
        filename,
        dispfilename,
        atchtype,
        filepath,
        idate,
      ];
}
