// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PackageDataModal _$PackageDataModalFromJson(Map<String, dynamic> json) =>
    PackageDataModal(
      packageId: json['packageId'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$PackageDataModalToJson(PackageDataModal instance) =>
    <String, dynamic>{
      'packageId': instance.packageId,
      'title': instance.title,
      'description': instance.description,
    };
