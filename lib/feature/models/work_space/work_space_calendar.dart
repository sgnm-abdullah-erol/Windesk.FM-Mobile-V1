import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'generator/work_space_calendar.g.dart';

@JsonSerializable()
class Calendar extends Equatable {
  final String? start;
  final String? end;
  final String? title;

  const Calendar({
    this.start,
    this.end,
    this.title,
  });

  factory Calendar.fromJson(Map<String, dynamic> json) => _$CalendarFromJson(json);

  @override
  List<Object?> get props => [
        start,
        end,
        title,
      ];
}
