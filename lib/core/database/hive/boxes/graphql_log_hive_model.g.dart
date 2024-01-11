// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'graphql_log_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GraphqlLogHiveModelAdapter extends TypeAdapter<GraphqlLogHiveModel> {
  @override
  final int typeId = 2;

  @override
  GraphqlLogHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GraphqlLogHiveModel(
      url: fields[0] as String?,
      query: fields[1] as String?,
      variables: fields[2] as String?,
      result: fields[3] as String?,
      date: fields[4] as String?,
      error: fields[5] as String?,
      logCatchError: fields[6] as String?,
      userToken: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, GraphqlLogHiveModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.url)
      ..writeByte(1)
      ..write(obj.query)
      ..writeByte(2)
      ..write(obj.variables)
      ..writeByte(3)
      ..write(obj.result)
      ..writeByte(4)
      ..write(obj.date)
      ..writeByte(5)
      ..write(obj.error)
      ..writeByte(6)
      ..write(obj.logCatchError)
      ..writeByte(7)
      ..write(obj.userToken);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GraphqlLogHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
