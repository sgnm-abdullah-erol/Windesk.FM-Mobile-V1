import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generator/work_space_documents.g.dart';

@JsonSerializable()
class WorkSpaceDocuments extends Equatable {
  final String? url;
  final int? id;
  final String? name;

  const WorkSpaceDocuments({
    this.url,
    this.id,
    this.name,
  });

  factory WorkSpaceDocuments.fromJson(Map<String, dynamic> json) => _$WorkSpaceDocumentsFromJson(json);

  Map<String, dynamic> toJson() => _$WorkSpaceDocumentsToJson(this);

  static List<WorkSpaceDocuments> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => WorkSpaceDocuments.fromJson(json)).toList();
  }

  @override
  List<Object?> get props => [
        url,
        id,
        name,
      ];
}
