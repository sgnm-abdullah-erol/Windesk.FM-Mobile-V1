import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generator/announcement_model.g.dart';
@JsonSerializable()
class AnnouncementModel extends Equatable {
  final String? name;
  final String? announcement;

  const AnnouncementModel({
    this.name,
    this.announcement,
  });

  factory AnnouncementModel.fromJson(Map<String, dynamic> json) {
    return _$AnnouncementModelFromJson(json);
  }
    Map<String, dynamic> toJson() => _$AnnouncementModelToJson(this);


    List<AnnouncementModel> fromJsonList(List<dynamic> json) {
    List<AnnouncementModel> workOrderLoads = [];

    for (var item in json) {
      workOrderLoads.add(AnnouncementModel.fromJson(item));
    }

    return workOrderLoads;
  }

  @override
  List<Object?> get props => [ 
        name,
        announcement,
      ];

}
