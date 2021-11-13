import 'package:json_annotation/json_annotation.dart';

part 'package.g.dart';

@JsonSerializable()
// Item is tour package details
class PackageDataModal {
  String packageId;
  String title;
  String description;

  PackageDataModal({
    required this.packageId,
    required this.title,
    required this.description,
  });

  factory PackageDataModal.fromJson(Map<String, dynamic> json) =>
      _$PackageDataModalFromJson(json);

  Map<String, dynamic> toJson(json) => _$PackageDataModalToJson(this);
}
