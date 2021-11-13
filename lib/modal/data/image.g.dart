// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageDataModal _$ImageDataModalFromJson(Map<String, dynamic> json) =>
    ImageDataModal(
      imageId: json['imageId'] as String,
      packageId: json['itemId'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$ImageDataModalToJson(ImageDataModal instance) =>
    <String, dynamic>{
      'imageId': instance.imageId,
      'itemId': instance.packageId,
      'image': instance.image,
    };
