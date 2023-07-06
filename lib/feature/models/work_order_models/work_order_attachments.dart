import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generator_work_order/work_order_attachments.g.dart';

@JsonSerializable()
class WorkOrderAttachments extends Equatable {
  final int? id;
  final String? name;
  final String? filename;
  final String? dispfilename;
  final String? atchtype;
  final String? filepath;
  final String? idate;

  const WorkOrderAttachments({
    this.id,
    this.name,
    this.filename,
    this.dispfilename,
    this.atchtype,
    this.filepath,
    this.idate,
  });

  factory WorkOrderAttachments.fromJson(Map<String, dynamic> json) => _$WorkOrderAttachmentsFromJson(json);

  Map<String, dynamic> toJson() => _$WorkOrderAttachmentsToJson(this);

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
