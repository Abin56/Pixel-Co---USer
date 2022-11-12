// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DBUserFavouritesAdapter extends TypeAdapter<DBUserFavourites> {
  @override
  final int typeId = 1;

  @override
  DBUserFavourites read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DBUserFavourites(
      productname: fields[0] as String,
      image: fields[1] as String,
      price: fields[2] as String,
      id: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DBUserFavourites obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.productname)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DBUserFavouritesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
