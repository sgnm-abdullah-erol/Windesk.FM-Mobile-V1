import 'package:equatable/equatable.dart';

class GraphqlLogServiceModel extends Equatable {
  final String? url;
  final String? query;
  final String? variables;
  final String? result;
  final String? date;
  final String? error;

  const GraphqlLogServiceModel({
    this.url,
    this.query,
    this.variables,
    this.result,
    this.date,
    this.error,
  });

  @override
  List<Object?> get props => [
        url,
        query,
        variables,
        result,
        date,
        error,
      ];
}
