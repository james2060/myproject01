// To parse this JSON data, do
//
//     final teamInfo = teamInfoFromJson(jsonString);

import 'dart:convert';

TeamInfo teamInfoFromJson(String str) => TeamInfo.fromJson(json.decode(str));

String teamInfoToJson(TeamInfo data) => json.encode(data.toJson());

class TeamInfo {
  int teamId;
  String teamName;
  DateTime createAt;
  DateTime foundedAt;
  String homeground;
  String founder;
  int playlevel;
  String desc;
  bool waitNewmember;
  bool openTeamInfo;
  int memberJoinCount;
  int memberSecedeCount;
  int memberCurrentCount;
  int memberWaitingCount;

  TeamInfo({
    required this.teamId,
    required this.teamName,
    required this.createAt,
    required this.foundedAt,
    required this.homeground,
    required this.founder,
    required this.playlevel,
    required this.desc,
    required this.waitNewmember,
    required this.openTeamInfo,
    required this.memberJoinCount,
    required this.memberSecedeCount,
    required this.memberCurrentCount,
    required this.memberWaitingCount,
  });

  factory TeamInfo.fromJson(Map<String, dynamic> json) => TeamInfo(
    teamId: json["team_id"],
    teamName: json["team_name"],
    createAt: DateTime.parse(json["create_at"]),
    foundedAt: DateTime.parse(json["founded_at"]),
    homeground: json["homeground"],
    founder: json["founder"],
    playlevel: json["playlevel"],
    desc: json["desc"],
    waitNewmember: json["wait_newmember"],
    openTeamInfo: json["open_team_info"],
    memberJoinCount: json["member_join_count"],
    memberSecedeCount: json["member_secede_count"],
    memberCurrentCount: json["member_current_count"],
    memberWaitingCount: json["member_waiting_count"],
  );

  Map<String, dynamic> toJson() => {
    "team_id": teamId,
    "team_name": teamName,
    "create_at": createAt.toIso8601String(),
    "founded_at": foundedAt.toIso8601String(),
    "homeground": homeground,
    "founder": founder,
    "playlevel": playlevel,
    "desc": desc,
    "wait_newmember": waitNewmember,
    "open_team_info": openTeamInfo,
    "member_join_count": memberJoinCount,
    "member_secede_count": memberSecedeCount,
    "member_current_count": memberCurrentCount,
    "member_waiting_count": memberWaitingCount,
  };
}
