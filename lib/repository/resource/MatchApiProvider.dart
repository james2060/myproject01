import 'dart:async';
import 'dart:convert';
import 'package:myproject01/model/match_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MatchApiProvider {

  List<MatchSchedule> ms = [];

  Future<List<MatchSchedule> > fetchMatchList() async {
    CollectionReference<Map<String, dynamic>> collectionReference = FirebaseFirestore.instance.collection("matchinfo");
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await collectionReference.orderBy("starttime",descending: true)
        .get();

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
          "starttime": "2023-11-04 07:00:00",
          "endtime": "2023-11-04 11:00:00",
          "location": "서울디지털운동장",
          "team1name": "그리드",
          "team2name": "시큐아이",
          "team1score": "0",
          "team2score": "0"
      }
    );
  }

}