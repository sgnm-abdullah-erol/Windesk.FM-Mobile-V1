import 'package:hive/hive.dart';

part 'graphql_log_hive_model.g.dart';

@HiveType(typeId: 2)
class GraphqlLogHiveModel {
  @HiveField(0)
  final String? url;
  @HiveField(1)
  final String? query;
  @HiveField(2)
  final String? variables;
  @HiveField(3)
  final String? result;
  @HiveField(4)
  final String? date;
  @HiveField(5)
  final String? error;
  @HiveField(6)
  final String? logCatchError;
  @HiveField(7)
  final String? userToken;

  const GraphqlLogHiveModel({
    this.url,
    this.query,
    this.variables,
    this.result,
    this.date,
    this.error,
    this.logCatchError,
    this.userToken,
  });
}
