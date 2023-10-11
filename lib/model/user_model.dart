// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  Userprofile? userprofile;

  User({
    this.userprofile,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    userprofile: json["userprofile"] == null ? null : Userprofile.fromJson(json["userprofile"]),
  );

  Map<String, dynamic> toJson() => {
    "userprofile": userprofile?.toJson(),
  };
}

class Userprofile {
  String? name;
  String? age;
  String? userid;
  String? userphone;
  String? groupidx;
  String? groupname;
  DateTime? regDate;
  DateTime? quitDate;
  String? firstPosition;
  String? experience;
  String? married;
  bool? stateofyongbyung;

  Userprofile({
    this.name,
    this.age,
    this.userid,
    this.userphone,
    this.groupidx,
    this.groupname,
    this.regDate,
    this.quitDate,
    this.firstPosition,
    this.experience,
    this.married,
    this.stateofyongbyung,
  });

  factory Userprofile.fromJson(Map<String, dynamic> json) => Userprofile(
    name: json["name"],
    age: json["age"],
    userid: json["userid"],
    userphone: json["userphone"],
    groupidx: json["groupidx"],
    groupname: json["groupname"],
    regDate: json["reg_date"] == null ? null : DateTime.parse(json["reg_date"]),
    quitDate: json["quit_date"] == null ? null : DateTime.parse(json["quit_date"]),
    firstPosition: json["first_position"],
    experience: json["experience"],
    married: json["married"],
    stateofyongbyung: json["stateofyongbyung"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "age": age,
    "userid": userid,
    "userphone": userphone,
    "groupidx": groupidx,
    "groupname": groupname,
    "reg_date": "${regDate!.year.toString().padLeft(4, '0')}-${regDate!.month.toString().padLeft(2, '0')}-${regDate!.day.toString().padLeft(2, '0')}",
    "quit_date": "${quitDate!.year.toString().padLeft(4, '0')}-${quitDate!.month.toString().padLeft(2, '0')}-${quitDate!.day.toString().padLeft(2, '0')}",
    "first_position": firstPosition,
    "experience": experience,
    "married": married,
    "stateofyongbyung": stateofyongbyung,
  };
}
