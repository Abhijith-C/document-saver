// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doc_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DocModelAdapter extends TypeAdapter<DocModel> {
  @override
  final int typeId = 1;

  @override
  DocModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DocModel(
      id: fields[0] as int?,
      image: fields[1] as Uint8List,
      title: fields[2] as String,
      description: fields[3] as String,
      category: fields[4] as String,
      expiringDate: fields[5] as DateTime,
      priority: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DocModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.category)
      ..writeByte(5)
      ..write(obj.expiringDate)
      ..writeByte(6)
      ..write(obj.priority);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DocModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
