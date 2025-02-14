// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_item_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CollectionItemModelAdapter extends TypeAdapter<CollectionItemModel> {
  @override
  final int typeId = 0;

  @override
  CollectionItemModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CollectionItemModel(
      id: fields[0] as String,
      brand: fields[1] as String,
      year: fields[2] as int,
      bottleNumber: fields[3] as String,
      owned: fields[4] as int,
      total: fields[5] as int,
      imagePath: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CollectionItemModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.brand)
      ..writeByte(2)
      ..write(obj.year)
      ..writeByte(3)
      ..write(obj.bottleNumber)
      ..writeByte(4)
      ..write(obj.owned)
      ..writeByte(5)
      ..write(obj.total)
      ..writeByte(6)
      ..write(obj.imagePath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CollectionItemModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
