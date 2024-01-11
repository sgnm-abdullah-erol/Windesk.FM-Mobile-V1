import 'package:hive/hive.dart';
import 'package:vm_fm_4/core/database/hive/boxes/http_log_hive_model.dart';

class LogHiveModelAdapter extends TypeAdapter<List<HttpLogHiveModel>> {
  @override
  final int typeId = 1; // Bu, LogHiveModel türüne atanan benzersiz bir tür kimliğidir.

  @override
  List<HttpLogHiveModel> read(BinaryReader reader) {
    final numOfLogs = reader.readByte();
    final logs = <HttpLogHiveModel>[];
    for (var i = 0; i < numOfLogs; i++) {
      logs.add(HttpLogHiveModel(
        response: reader.readString(),
        requestPath: reader.readString(),
        statusCode: reader.readInt(),
        headers: reader.readString(),
        error: reader.readString(),
        date: reader.readString(),
        userToken: reader.readString(),
      ));
    }
    return logs;
  }

  @override
  void write(BinaryWriter writer, List<HttpLogHiveModel> obj) {
    writer.writeByte(obj.length);
    for (var i = 0; i < obj.length; i++) {
      writer.writeString(obj[i].response ?? '');
      writer.writeString(obj[i].requestPath ?? '');
      writer.writeInt(obj[i].statusCode ?? 0);
      writer.writeString(obj[i].headers ?? '');
      writer.writeString(obj[i].error ?? '');
      writer.writeString(obj[i].date.toString());
      writer.writeString(obj[i].userToken ?? '');
    }
  }
}
