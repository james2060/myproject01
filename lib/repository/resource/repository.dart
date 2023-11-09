import 'dart:async';
import 'package:myproject01/repository/resource/MatchApiProvider.dart';
import 'package:myproject01/model/match_model.dart';
class Repository {

  final matchApiProvider = MatchApiProvider();

  Future<List<MatchSchedule>> fetchAllMatchInfo() => matchApiProvider.fetchMatchList();

  Future<void> addMatchInfo(String date) => matchApiProvider.AddMatchSchedule(date);

}