// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_flight_info_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SearchFlightInfoHiveAdapter extends TypeAdapter<SearchFlightInfoHive> {
  @override
  final int typeId = 0;

  @override
  SearchFlightInfoHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SearchFlightInfoHive(
      departLocationCode: fields[0] as String,
      departLocationName: fields[1] as String,
      returnLocationCode: fields[2] as String,
      returnLocationName: fields[3] as String,
      isRoundTrip: fields[4] as bool,
      isDome: fields[5] as bool,
      adult: fields[6] as int,
      child: fields[7] as int,
      infant: fields[8] as int,
      departFlightDate: fields[9] as DateTime?,
      returnFlightDate: fields[10] as DateTime?,
      bookingNumber: fields[11] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, SearchFlightInfoHive obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.departLocationCode)
      ..writeByte(1)
      ..write(obj.departLocationName)
      ..writeByte(2)
      ..write(obj.returnLocationCode)
      ..writeByte(3)
      ..write(obj.returnLocationName)
      ..writeByte(4)
      ..write(obj.isRoundTrip)
      ..writeByte(5)
      ..write(obj.isDome)
      ..writeByte(6)
      ..write(obj.adult)
      ..writeByte(7)
      ..write(obj.child)
      ..writeByte(8)
      ..write(obj.infant)
      ..writeByte(9)
      ..write(obj.departFlightDate)
      ..writeByte(10)
      ..write(obj.returnFlightDate)
      ..writeByte(11)
      ..write(obj.bookingNumber);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchFlightInfoHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
