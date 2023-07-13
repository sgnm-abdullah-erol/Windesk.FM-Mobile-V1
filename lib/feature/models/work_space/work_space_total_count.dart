import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generator/work_space_total_count.g.dart';

@JsonSerializable()
class TotalCount extends Equatable {
  final int? low;
  final int? high;

  const TotalCount({
    this.low,
    this.high,
  });

  factory TotalCount.fromJson(Map<String, dynamic> json) => _$TotalCountFromJson(json);

  @override
  List<Object?> get props => [
        low,
        high,
      ];
}
