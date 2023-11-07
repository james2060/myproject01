// To parse this JSON data, do
//
//     final matchSchedule = matchScheduleFromJson(jsonString);

import 'dart:convert';

MatchSchedule matchScheduleFromJson(String str) => MatchSchedule.fromJson(json.decode(str));

String matchScheduleToJson(MatchSchedule data) => json.encode(data.toJson());

class MatchSchedule {
  Matchinfo? matchinfo;

  MatchSchedule({
    this.matchinfo,
  });

  factory MatchSchedule.fromJson(Map<String, dynamic> json) => MatchSchedule(
    matchinfo: json == null ? null : Matchinfo.fromJson(json),
  );

  Map<String, dynamic> toJson() => {
    "matchinfo": matchinfo?.toJson(),
  };
}

class Matchinfo {
  DateTime starttime;
  DateTime endtime;
  String location;
  String team1Name;
  String team2Name;
  String team1Score;
  String team2Score;

  Matchinfo({
    required this.starttime,
    required this.endtime,
    required this.location,
    required this.team1Name,
    required this.team2Name,
    required this.team1Score,
    required this.team2Score,
  });

  factory Matchinfo.fromJson(Map<String, dynamic> json) => Matchinfo(
    starttime: DateTime.parse(json["starttime"]),
    endtime: DateTime.parse(json["endtime"]),
    location: json["location"],
    team1Name: json["team1_name"],
    team2Name: json["team2_name"],
    team1Score: json["team1_score"],
    team2Score: json["team2_score"],
  );

  Map<String, dynamic> toJson() => {
    "starttime": starttime.toIso8601String(),
    "endtime": endtime.toIso8601String(),
    "location": location,
    "team1_name": team1Name,
    "team2_name": team2Name,
    "team1_score": team1Score,
    "team2_score": team2Score,
  };
}
