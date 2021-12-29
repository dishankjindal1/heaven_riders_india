import 'package:json_annotation/json_annotation.dart';

part 'image.g.dart';

@JsonSerializable()
//Image data
class ImageDataModal {
  String imageId;
  String packageId;
  String image;

  ImageDataModal(
      {required this.imageId, required this.packageId, required this.image});

  factory ImageDataModal.fromJson(Map<String, dynamic> json) =>
      _$ImageDataModalFromJson(json);

  Map<String, dynamic> toJson(json) => _$ImageDataModalToJson(this);
}
