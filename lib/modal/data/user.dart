import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
// user data
class UserDataModal {
  // user id
  // name
  // address
  // contact
  // last login
  // favourites list
  // booking [cart, payment pending, booked]

  String userId;
  String name;
  String contact;

  UserDataModal(
      {required this.userId, required this.name, required this.contact});
  UserDataModal.initial(
      {this.userId = 'random',
      this.name = 'no auth',
      this.contact = '23423423423'});

  factory UserDataModal.fromJson(Map<String, dynamic> json) =>
      _$UserDataModalFromJson(json);

  Map<String, dynamic> toJson(json) => _$UserDataModalToJson(this);
}
