import 'package:hive/hive.dart';
import 'package:vm_fm_4/core/database/hive/boxes/log_hive_model.dart';

class LogHiveModelAdapter extends TypeAdapter<List<LogHiveModel>> {
  @override
  final int typeId = 1; // Bu, LogHiveModel türüne atanan benzersiz bir tür kimliğidir.

  @override
  List<LogHiveModel> read(BinaryReader reader) {
    final numOfLogs = reader.readByte();
    final logs = <LogHiveModel>[];
    for (var i = 0; i < numOfLogs; i++) {
      logs.add(LogHiveModel(
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
  void write(BinaryWriter writer, List<LogHiveModel> logs) {
    writer.writeByte(logs.length);
    for (var i = 0; i < logs.length; i++) {
      writer.writeString(logs[i].response ?? '');
      writer.writeString(logs[i].requestPath ?? '');
      writer.writeInt(logs[i].statusCode ?? 0);
      writer.writeString(logs[i].headers ?? '');
      writer.writeString(logs[i].error ?? '');
      writer.writeString(logs[i].date.toString());
      writer.writeString(logs[i].userToken ?? '');
    }
  }
}
