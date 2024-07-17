// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

import 'package:myutils/data/cache_helper/models/gtd_cached_object.dart';
import 'package:myutils/data/repositories/gtd_api_client/customer_resource/models/response/gtd_saved_traveller_rs.dart';

part 'gtd_account_hive.g.dart';

@HiveType(typeId: 4)
class GtdAccountHive extends GtdCachedObject {
  @HiveField(0)
  int? id;
  @HiveField(1)
  int? profileId;
  @HiveField(2)
  int? travellerId;
  @HiveField(3)
  String? firstName;
  @HiveField(4)
  String? lastName;
  @HiveField(5)
  String? avatarImage;
  @HiveField(6)
  String? gender;
  @HiveField(7)
  DateTime? dateOfBirth;
  @HiveField(8)
  String? nationality;
  @HiveField(9)
  String? email;
  @HiveField(10)
  String? passportNumber;
  @HiveField(11)
  String? passportCountry;
  @HiveField(12)
  DateTime? passportExpireDate;
  @HiveField(13)
  String? membershipClass;
  @HiveField(14)
  String? orgCode;
  @HiveField(15)
  String? branchCode;
  @HiveField(16)
  String? customerCode;
  @HiveField(17)
  String? userRefcode;
  @HiveField(18)
  List<MemberCard>? listMemberCard;
  @HiveField(19)
  String? typeLogin;

  GtdAccountHive({
    this.id,
    this.profileId,
    this.travellerId,
    this.firstName,
    this.lastName,
    this.avatarImage,
    this.gender,
    this.dateOfBirth,
    this.nationality,
    this.email,
    this.passportNumber,
    this.passportCountry,
    this.passportExpireDate,
    this.membershipClass,
    this.orgCode,
    this.branchCode,
    this.customerCode,
    this.userRefcode,
    this.listMemberCard,
    this.typeLogin
  });

  GtdAccountHive copyWith({
    int? id,
    int? profileId,
    int? travellerId,
    String? firstName,
    String? lastName,
    String? avatarImage,
    String? gender,
    DateTime? dateOfBirth,
    String? nationality,
    String? email,
    String? passportNumber,
    String? passportCountry,
    DateTime? passportExpireDate,
    String? membershipClass,
    String? orgCode,
    String? branchCode,
    String? customerCode,
    String? userRefcode,
    List<MemberCard>? listMemberCard,
    String? typeLogin,
  }) {
    return GtdAccountHive(
      id: id ?? this.id,
      profileId: profileId ?? this.profileId,
      travellerId: travellerId ?? this.travellerId,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      avatarImage: avatarImage ?? this.avatarImage,
      gender: gender ?? this.gender,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      nationality: nationality ?? this.nationality,
      email: email ?? this.email,
      passportNumber: passportNumber ?? this.passportNumber,
      passportCountry: passportCountry ?? this.passportCountry,
      passportExpireDate: passportExpireDate ?? this.passportExpireDate,
      membershipClass: membershipClass ?? this.membershipClass,
      orgCode: orgCode ?? this.orgCode,
      branchCode: branchCode ?? this.branchCode,
      customerCode: customerCode ?? this.customerCode,
      userRefcode: userRefcode ?? this.userRefcode,
      listMemberCard: listMemberCard ?? this.listMemberCard,
      typeLogin: typeLogin ?? this.typeLogin,
    );
  }
  Map<String, dynamic> toCachedObject() {
    return <String, dynamic>{
      'id': id,
      'profileId': profileId,
      'travellerId': travellerId,
      'firstName': firstName,
      'lastName': lastName,
      'avatarImage': avatarImage,
      'gender': gender,
      'dateOfBirth': dateOfBirth?.millisecondsSinceEpoch,
      'nationality': nationality,
      'email': email,
      'passportNumber': passportNumber,
      'passportCountry': passportCountry,
      'passportExpireDate': passportExpireDate?.millisecondsSinceEpoch,
      'membershipClass': membershipClass,
      'orgCode': orgCode,
      'branchCode': branchCode,
      'customerCode': customerCode,
      'userRefcode': userRefcode,
      // 'listMemberCard': listMemberCard?.map((card) => card.toCachedObject()).toList(),
      'typeLogin': typeLogin,
    };
  }

  factory GtdAccountHive.fromCachedObject(Map<String, dynamic> data) {
    return GtdAccountHive(
      id: data['id'] as int?,
      profileId: data['profileId'] as int?,
      travellerId: data['travellerId'] as int?,
      firstName: data['firstName'] as String?,
      lastName: data['lastName'] as String?,
      avatarImage: data['avatarImage'] as String?,
      gender: data['gender'] as String?,
      dateOfBirth: data['dateOfBirth'] != null
          ? DateTime.fromMillisecondsSinceEpoch(data['dateOfBirth'] as int)
          : null,
      nationality: data['nationality'] as String?,
      email: data['email'] as String?,
      passportNumber: data['passportNumber'] as String?,
      passportCountry: data['passportCountry'] as String?,
      passportExpireDate: data['passportExpireDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(data['passportExpireDate'] as int)
          : null,
      membershipClass: data['membershipClass'] as String?,
      orgCode: data['orgCode'] as String?,
      branchCode: data['branchCode'] as String?,
      customerCode: data['customerCode'] as String?,
      userRefcode: data['userRefcode'] as String?,
      // listMemberCard: (data['listMemberCard'] as List<dynamic>?)
      //     ?.map((card) => MemberCard.fromCachedObject(card as Map<String, dynamic>))
      //     .toList(),
      typeLogin: data['typeLogin'] as String?,
    );
  }

  @override
  int get typeId => 4;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'profileId': profileId,
      'travellerId': travellerId,
      'firstName': firstName,
      'lastName': lastName,
      'avatarImage': avatarImage,
      'gender': gender,
      'dateOfBirth': dateOfBirth?.millisecondsSinceEpoch,
      'nationality': nationality,
      'email': email,
      'passportNumber': passportNumber,
      'passportCountry': passportCountry,
      'passportExpireDate': passportExpireDate?.millisecondsSinceEpoch,
      'membershipClass': membershipClass,
      'orgCode': orgCode,
      'branchCode': branchCode,
      'customerCode': customerCode,
      'userRefcode': userRefcode,
      'listMemberCard': listMemberCard?.map((x) => x.toJson()).toList(),
      'typeLogin': typeLogin,
    };
  }

  factory GtdAccountHive.fromMap(Map<String, dynamic> map) {
    return GtdAccountHive(
      id: map['id'] != null ? map['id'] as int : null,
      profileId: map['profileId'] != null ? map['profileId'] as int : null,
      travellerId: map['travellerId'] != null ? map['travellerId'] as int : null,
      firstName: map['firstName'] != null ? map['firstName'] as String : null,
      lastName: map['lastName'] != null ? map['lastName'] as String : null,
      avatarImage: map['avatarImage'] != null ? map['avatarImage'] as String : null,
      gender: map['gender'] != null ? map['gender'] as String : null,
      dateOfBirth: map['dateOfBirth'] != null ? DateTime.fromMillisecondsSinceEpoch(map['dateOfBirth'] as int) : null,
      nationality: map['nationality'] != null ? map['nationality'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      passportNumber: map['passportNumber'] != null ? map['passportNumber'] as String : null,
      passportCountry: map['passportCountry'] != null ? map['passportCountry'] as String : null,
      passportExpireDate: map['passportExpireDate'] != null ? DateTime.fromMillisecondsSinceEpoch(map['passportExpireDate'] as int) : null,
      membershipClass: map['membershipClass'] != null ? map['membershipClass'] as String : null,
      orgCode: map['orgCode'] != null ? map['orgCode'] as String : null,
      branchCode: map['branchCode'] != null ? map['branchCode'] as String : null,
      customerCode: map['customerCode'] != null ? map['customerCode'] as String : null,
      userRefcode: map['userRefcode'] != null ? map['userRefcode'] as String : null,
      listMemberCard: map['listMemberCard'] != null ? List<MemberCard>.from((map['listMemberCard'] as List<int>).map<MemberCard?>((x) => MemberCard.fromJson(x as Map<String,dynamic>),),) : null,
      typeLogin: map['typeLogin'] != null ? map['typeLogin'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GtdAccountHive.fromJson(String source) => GtdAccountHive.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'GtdAccountHive(id: $id, profileId: $profileId, travellerId: $travellerId, firstName: $firstName, lastName: $lastName, avatarImage: $avatarImage, gender: $gender, dateOfBirth: $dateOfBirth, nationality: $nationality, email: $email, passportNumber: $passportNumber, passportCountry: $passportCountry, passportExpireDate: $passportExpireDate, membershipClass: $membershipClass, orgCode: $orgCode, branchCode: $branchCode, customerCode: $customerCode, userRefcode: $userRefcode, listMemberCard: $listMemberCard, typeLogin: $typeLogin)';
  }

  @override
  bool operator ==(covariant GtdAccountHive other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.profileId == profileId &&
      other.travellerId == travellerId &&
      other.firstName == firstName &&
      other.lastName == lastName &&
      other.avatarImage == avatarImage &&
      other.gender == gender &&
      other.dateOfBirth == dateOfBirth &&
      other.nationality == nationality &&
      other.email == email &&
      other.passportNumber == passportNumber &&
      other.passportCountry == passportCountry &&
      other.passportExpireDate == passportExpireDate &&
      other.membershipClass == membershipClass &&
      other.orgCode == orgCode &&
      other.branchCode == branchCode &&
      other.customerCode == customerCode &&
      other.userRefcode == userRefcode &&
      listEquals(other.listMemberCard, listMemberCard) &&
      other.typeLogin == typeLogin;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      profileId.hashCode ^
      travellerId.hashCode ^
      firstName.hashCode ^
      lastName.hashCode ^
      avatarImage.hashCode ^
      gender.hashCode ^
      dateOfBirth.hashCode ^
      nationality.hashCode ^
      email.hashCode ^
      passportNumber.hashCode ^
      passportCountry.hashCode ^
      passportExpireDate.hashCode ^
      membershipClass.hashCode ^
      orgCode.hashCode ^
      branchCode.hashCode ^
      customerCode.hashCode ^
      userRefcode.hashCode ^
      listMemberCard.hashCode ^
      typeLogin.hashCode;
  }
}
