// To parse this JSON data, do
//
//     final teamModel = teamModelFromJson(jsonString);

import 'dart:convert';

TeamModel teamModelFromJson(String str) => TeamModel.fromJson(json.decode(str));

String teamModelToJson(TeamModel data) => json.encode(data.toJson());

class TeamModel {
  TeamProfile? teamProfile;

  TeamModel({
    this.teamProfile,
  });

  factory TeamModel.fromJson(Map<String, dynamic> json) => TeamModel(
    teamProfile: json["TeamProfile"] == null ? null : TeamProfile.fromJson(json["TeamProfile"]),
  );

  Map<String, dynamic> toJson() => {
    "TeamProfile": teamProfile?.toJson(),
  };
}

class TeamProfile {
  int? iteamidx;
  String? steamname;
  DateTime? screateDate;
  String? homeground;
  String? createdby;
  int? level;
  String? desc;
  bool? waitNewmember;
  bool? openGroupInfo;

  TeamProfile({
    this.iteamidx,
    this.steamname,
    this.screateDate,
    this.homeground,
    this.createdby,
    this.level,
    this.desc,
    this.waitNewmember,
    this.openGroupInfo,
  });

  factory TeamProfile.fromJson(Map<String, dynamic> json) => TeamProfile(
    iteamidx: json["iteamidx"],
    steamname: json["steamname"],
    screateDate: json["screate_date"] == null ? null : DateTime.parse(json["screate_date"]),
    homeground: json["homeground"],
    createdby: json["createdby"],
    level: json["level"],
    desc: json["desc"],
    waitNewmember: json["wait_newmember"],
    openGroupInfo: json["open_group_info"],
  );

  Map<String, dynamic> toJson() => {
    "iteamidx": iteamidx,
    "steamname": steamname,
    "screate_date": screateDate?.toIso8601String(),
    "homeground": homeground,
    "createdby": createdby,
    "level": level,
    "desc": desc,
    "wait_newmember": waitNewmember,
    "open_group_info": openGroupInfo,
  };
}
