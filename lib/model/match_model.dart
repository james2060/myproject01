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
    matchinfo: json["matchinfo"] == null ? null : Matchinfo.fromJson(json["matchinfo"]),
  );

  Map<String, dynamic> toJson() => {
    "matchinfo": matchinfo?.toJson(),
  };
}

class Matchinfo {
  DateTime? date;
  DateTime? starttime;
  DateTime? endtime;
  String? location;
  String? team1;
  String? team2;

  Matchinfo({
    this.date,
    this.starttime,
    this.endtime,
    this.location,
    this.team1,
    this.team2,
  });

  factory Matchinfo.fromJson(Map<String, dynamic> json) => Matchinfo(
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    starttime: json["starttime"] == null ? null : DateTime.parse(json["starttime"]),
    endtime: json["endtime"] == null ? null : DateTime.parse(json["endtime"]),
    location: json["location"],
    team1: json["team1"],
    team2: json["team2"],
  );

  Map<String, dynamic> toJson() => {
    "date": date?.toIso8601String(),
    "starttime": starttime?.toIso8601String(),
    "endtime": endtime?.toIso8601String(),
    "location": location,
    "team1": team1,
    "team2": team2,
  };
}
