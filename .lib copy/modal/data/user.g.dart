// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDataModal _$UserDataModalFromJson(Map<String, dynamic> json) =>
    UserDataModal(
      userId: json['userId'] as String,
      name: json['name'] as String,
      contact: json['contact'] as String,
    );

Map<String, dynamic> _$UserDataModalToJson(UserDataModal instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'name': instance.name,
      'contact': instance.contact,
    };
