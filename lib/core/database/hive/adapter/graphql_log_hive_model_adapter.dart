import 'package:hive/hive.dart';
import 'package:vm_fm_4/core/database/hive/boxes/graphql_log_hive_model.dart';

class GraphqlLogHiveModelAdapter extends TypeAdapter<List<GraphqlLogHiveModel>> {
  @override
  final int typeId = 2;

  @override
  List<GraphqlLogHiveModel> read(BinaryReader reader) {
    final numOfLogs = reader.readByte();
    final logs = <GraphqlLogHiveModel>[];
    for (var i = 0; i < numOfLogs; i++) {
      logs.add(
        GraphqlLogHiveModel(
          url: reader.readString(),
          query: reader.readString(),
          variables: reader.readString(),
          result: reader.readString(),
          date: reader.readString(),
          error: reader.readString(),
          logCatchError: reader.readString(),
          userToken: reader.readString(),
        ),
      );
    }
    return logs;
  }

  @override
  void write(BinaryWriter writer, List<GraphqlLogHiveModel> obj) {
    writer.writeByte(obj.length);
    for (var i = 0; i < obj.length; i++) {
      writer.writeString(obj[i].url ?? '');
      writer.writeString(obj[i].query ?? '');
      writer.writeString(obj[i].variables ?? '');
      writer.writeString(obj[i].result ?? '');
      writer.writeString(obj[i].date.toString());
      writer.writeString(obj[i].error ?? '');
      writer.writeString(obj[i].logCatchError ?? '');
      writer.writeString(obj[i].userToken ?? '');
    }
  }
}
