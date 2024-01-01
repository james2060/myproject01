import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'package:get/get.dart';
import 'package:myproject01/model/match_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MatchApiProvider {

  List<MatchSchedule> ms = [];

  Future<List<MatchSchedule> > fetchMatchList() async {
    CollectionReference<Map<String, dynamic>> collectionReference = FirebaseFirestore.instance.collection("matchinfo");

    if(collectionReference == null) {
      List<MatchSchedule> m = [];
      return m;
    }
    DateTime _now = DateTime.now();
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await collectionReference.where('team1_id', isEqualTo: 1)
        .orderBy("starttime",descending: false).get();
    ms.clear();
    for( var document in querySnapshot.docs) {
      ms.add(MatchSchedule.fromJson(document.data()));
    }
    var itemcount = ms.length;

    print("match list size: $itemcount");

    return ms;
  }

  //경기 일정 등록.
  Future<void> AddMatchSchedule(String date) async {
    FirebaseFirestore _f = FirebaseFirestore.instance;
    await _f.collection("matchinfo").doc(date).set(
        {
        "idx" : 1000,
        "team1_id" : 1,
        "team2_id" : 2,
        "starttime":"2023-12-31 07:00:00",
        "endtime" :  "2023-12-31 11:00:00",
        "location":"서울디지털운동장",
        "team1_name": "GridFC",
        "team2_name": "스트레인져스",
        "team1_score": 0,
        "team2_score": 0,
        "result" : 1,
        "attendancd_count": 13,
        "nonappearance_count": 13
        }
    );
  }

}