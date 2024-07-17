// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gtd_account_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GtdAccountHiveAdapter extends TypeAdapter<GtdAccountHive> {
  @override
  final int typeId = 4;

  @override
  GtdAccountHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GtdAccountHive(
      id: fields[0] as int?,
      profileId: fields[1] as int?,
      travellerId: fields[2] as int?,
      firstName: fields[3] as String?,
      lastName: fields[4] as String?,
      gender: fields[6] as String?,
      dateOfBirth: fields[7] as DateTime?,
      nationality: fields[8] as String?,
      email: fields[9] as String?,
      passportNumber: fields[10] as String?,
      passportCountry: fields[11] as String?,
      passportExpireDate: fields[12] as DateTime?,
      avatarImage: fields[5] as String?,
      membershipClass: fields[13] as String?,
      branchCode: fields[15] as String?,
      customerCode: fields[16] as String?,
      orgCode: fields[14] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, GtdAccountHive obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.profileId)
      ..writeByte(2)
      ..write(obj.travellerId)
      ..writeByte(3)
      ..write(obj.firstName)
      ..writeByte(4)
      ..write(obj.lastName)
      ..writeByte(5)
      ..write(obj.avatarImage)
      ..writeByte(6)
      ..write(obj.gender)
      ..writeByte(7)
      ..write(obj.dateOfBirth)
      ..writeByte(8)
      ..write(obj.nationality)
      ..writeByte(9)
      ..write(obj.email)
      ..writeByte(10)
      ..write(obj.passportNumber)
      ..writeByte(11)
      ..write(obj.passportCountry)
      ..writeByte(12)
      ..write(obj.passportExpireDate)
      ..writeByte(13)
      ..write(obj.membershipClass)
      ..writeByte(14)
      ..write(obj.orgCode)
      ..writeByte(15)
      ..write(obj.branchCode)
      ..writeByte(16)
      ..write(obj.customerCode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GtdAccountHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
