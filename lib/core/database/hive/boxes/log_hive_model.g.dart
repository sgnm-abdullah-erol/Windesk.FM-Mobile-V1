// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LogHiveModelAdapter extends TypeAdapter<LogHiveModel> {
  @override
  final int typeId = 1;

  @override
  LogHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LogHiveModel(
      response: fields[0] as String?,
      requestPath: fields[1] as String?,
      statusCode: fields[2] as int?,
      headers: fields[3] as String?,
      error: fields[4] as String?,
      logCatchError: fields[5] as String?,
      date: fields[6] as String?,
      userToken: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, LogHiveModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.response)
      ..writeByte(1)
      ..write(obj.requestPath)
      ..writeByte(2)
      ..write(obj.statusCode)
      ..writeByte(3)
      ..write(obj.headers)
      ..writeByte(4)
      ..write(obj.error)
      ..writeByte(5)
      ..write(obj.logCatchError)
      ..writeByte(6)
      ..write(obj.date)
      ..writeByte(7)
      ..write(obj.userToken);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LogHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
