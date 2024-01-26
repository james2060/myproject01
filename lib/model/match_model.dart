import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class MatchSchedule {
  Matchinfo matchinfo;

  MatchSchedule({
    required this.matchinfo,
  });

  MatchSchedule copyWith({
    Matchinfo? matchinfo,
  }) =>
      MatchSchedule(
        matchinfo: matchinfo ?? this.matchinfo,
      );

  factory MatchSchedule.fromRawJson(String str) => MatchSchedule.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MatchSchedule.fromJson(Map<String, dynamic> json) => MatchSchedule(
    matchinfo: Matchinfo.fromJson(json),
  );

  Map<String, dynamic> toJson() => {
    "matchinfo": matchinfo.toJson(),
  };
}

class Matchinfo {
  int idx;
  int team1Id;
  int team2Id;
  Timestamp starttime;
  Timestamp endtime;
  String location;
  String team1Name;
  String team2Name;
  int team1Score;
  int team2Score;
  int result;
  int attendancedCount;
  int nonappearanceCount;

  Matchinfo({
    required this.idx,
    required this.team1Id,
    required this.team2Id,
    required this.starttime,
    required this.endtime,
    required this.location,
    required this.team1Name,
    required this.team2Name,
    required this.team1Score,
    required this.team2Score,
    required this.result,
    required this.attendancedCount,
    required this.nonappearanceCount,
  });

  Matchinfo copyWith({
    int? idx,
    int? team1Id,
    int? team2Id,
    Timestamp? starttime,
    Timestamp? endtime,
    String? location,
    String? team1Name,
    String? team2Name,
    int? team1Score,
    int? team2Score,
    int? result,
    int? attendancedCount,
    int? nonappearanceCount,
  }) =>
      Matchinfo(
        idx: idx ?? this.idx,
        team1Id: team1Id ?? this.team1Id,
        team2Id: team2Id ?? this.team2Id,
        starttime: starttime ?? this.starttime,
        endtime: endtime ?? this.endtime,
        location: location ?? this.location,
        team1Name: team1Name ?? this.team1Name,
        team2Name: team2Name ?? this.team2Name,
        team1Score: team1Score ?? this.team1Score,
        team2Score: team2Score ?? this.team2Score,
        result: result ?? this.result,
        attendancedCount: attendancedCount ?? this.attendancedCount,
        nonappearanceCount: nonappearanceCount ?? this.nonappearanceCount,
      );

  factory Matchinfo.fromRawJson(String str) => Matchinfo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

    factory Matchinfo.fromJson(Map<String, dynamic> json) => Matchinfo(
    idx: json["idx"],
    team1Id: json["team1_id"],
    team2Id: json["team2_id"],
    starttime: json["starttime"],
    endtime: json["endtime"],
    location: json["location"],
    team1Name: json["team1_name"],
    team2Name: json["team2_name"],
    team1Score: json["team1_score"],
    team2Score: json["team2_score"],
    result: json["result"],
    attendancedCount: json["attendanced_count"],
    nonappearanceCount: json["nonappearance_count"],
  );

  Map<String, dynamic> toJson() => {
    "idx": idx,
    "team1_id": team1Id,
    "team2_id": team2Id,
    "starttime": starttime.toString(),
    "endtime": endtime.toString(),
    "location": location,
    "team1_name": team1Name,
    "team2_name": team2Name,
    "team1_score": team1Score,
    "team2_score": team2Score,
    "result": result,
    "attendancedCount": attendancedCount,
    "nonappearance_count": nonappearanceCount,
  };
}
