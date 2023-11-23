// To parse this JSON data, do
//
//     final users = usersFromJson(jsonString);

import 'dart:convert';

User usersFromJson(String str) => User.fromJson(json.decode(str));

String usersToJson(User data) => json.encode(data.toJson());

class User {
  String name;
  String email;
  String id;
  String cellphone;
  int teamId;
  String teamName;
  DateTime regstryAt;
  DateTime quitAt;
  String position1;
  String position2;
  DateTime birthday;
  String experience;
  String married;
  String profileImgLink;
  bool stateofyongbyung;

  User({
    required this.name,
    required this.email,
    required this.id,
    required this.cellphone,
    required this.teamId,
    required this.teamName,
    required this.regstryAt,
    required this.quitAt,
    required this.position1,
    required this.position2,
    required this.birthday,
    required this.experience,
    required this.married,
    required this.profileImgLink,
    required this.stateofyongbyung,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    name: json["name"],
    email: json["email"],
    id: json["id"],
    cellphone: json["cellphone"],
    teamId: json["team_id"],
    teamName: json["tea _name"],
    regstryAt: DateTime.parse(json["regstry_at"]),
    quitAt: DateTime.parse(json["quit_at"]),
    position1: json["position1"],
    position2: json["position2"],
    birthday: DateTime.parse(json["birthday"]),
    experience: json["experience"],
    married: json["married"],
    profileImgLink: json["profile_img_link"],
    stateofyongbyung: json["stateofyongbyung"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "id": id,
    "cellphone": cellphone,
    "group_id": teamId,
    "group_name": teamName,
    "regstry_at": "${regstryAt.year.toString().padLeft(4, '0')}-${regstryAt.month.toString().padLeft(2, '0')}-${regstryAt.day.toString().padLeft(2, '0')}",
    "quit_at": "${quitAt.year.toString().padLeft(4, '0')}-${quitAt.month.toString().padLeft(2, '0')}-${quitAt.day.toString().padLeft(2, '0')}",
    "position1": position1,
    "position2": position2,
    "birthday": "${birthday.year.toString().padLeft(4, '0')}-${birthday.month.toString().padLeft(2, '0')}-${birthday.day.toString().padLeft(2, '0')}",
    "experience": experience,
    "married": married,
    "profile_img_link": profileImgLink,
    "stateofyongbyung": stateofyongbyung,
  };
}
