import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:myproject01/model/team_model.dart';
import 'package:myproject01/model/match_model.dart';
import 'package:myproject01/model/user_model.dart';
import 'package:myproject01/model/relative_record.dart';
import 'dart:developer';
import 'package:myproject01/utils/constants.dart';

FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

class FirestoreDb{

  //팀 등록
  void addToTeam(String collectionName, String docName,TeamInfo teamProfile) async {
    await _firebaseFirestore.collection(collectionName).doc(docName)
        .set( teamProfile.toJson());
  }

  //사용자 정보 추가
  void addToUser(String uid, String collectionName, String docName, User user) async {
    await _firebaseFirestore.collection(collectionName).doc(docName)
        .set(user.toJson());
  }

  //경기 일정 등록
  void addToMatch(String team_id, String collectionName, String docName, MatchSchedule matchSchedule) async {
    await _firebaseFirestore.collection(collectionName).doc(docName)
        .set( matchSchedule.toJson());
  }
  //경기 전체 일정
  static Future<List<MatchSchedule> > fetchMatchList(int teamid) async {

    List<MatchSchedule> matchschedule = [];

    CollectionReference<Map<String, dynamic>> collectionReference = FirebaseFirestore.instance.collection("matchinfo");
      QuerySnapshot<Map<String, dynamic>> querySnapshot
      = await collectionReference
          .get();

      matchschedule.clear();
      for( var document in querySnapshot.docs) {
        matchschedule.add(MatchSchedule.fromJson(document.data()));
      }
      var itemcount = matchschedule.length;
      print("match list size: $itemcount");

      return matchschedule;
  }
  static Future<MatchSchedule> fetchNextMatch() async {
    var next=null;
    DateTime now = DateTime.now();
    CollectionReference<Map<String, dynamic>> collectionReference =
    FirebaseFirestore.instance.collection("matchinfo");
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
    await collectionReference.where('team1_id', isEqualTo: 1).where('starttime', isGreaterThan: now )
        .orderBy("starttime",descending: false).limit(1).get();

    if(querySnapshot.docs.length == 0) {
      //다음 경기가 없는 것이므로, 예외처리 필요.
    }
    for( var document in querySnapshot.docs) {
     next = MatchSchedule.fromJson(document.data());
     if(next != null)
       return next;
    }
    //null 리턴은 에러가 발생한다. Type 리턴을 해야할까? 20240304
    return next;
  }
  //상대 전적/평균 실점
  static Future<RelativeRecord?> fetchRelativeRecord(int team1_id, int team2_id) async {
    int? win = 0;
    int? draw = 0;
    int? lose = 0;

    CollectionReference<Map<String, dynamic>> collectionReference =
    FirebaseFirestore.instance.collection("matchinfo");
    //무
    await collectionReference.where('team1_id', isEqualTo: team1_id).
    where('team2_id', isEqualTo: team2_id ).where('result', isEqualTo: 1)
        .count().get().then(
           (res) => draw=res.count,
            onError: (e) => debugPrint('Error: $e'),
    );
    //승
    await collectionReference.where('team1_id', isEqualTo: team1_id).
    where('team2_id', isEqualTo: team2_id ).where('result', isEqualTo: 2)
        .count().get().then(
          (res) => win=res.count,
      onError: (e) => debugPrint('Error: $e'),
    );
    //패
    await collectionReference.where('team1_id', isEqualTo: team1_id).
    where('team2_id', isEqualTo: team2_id ).where('result', isEqualTo: 0)
        .count().get().then(
          (res) => lose=res.count,
      onError: (e) => debugPrint('Error: $e'),
    );

    RelativeRecord? record = RelativeRecord(win: win, draw: draw, lose: lose);

    return record;
  }
//참석 투표 카운트 업데이트
 static Future<void> updateAttendance(bool isstate, int teamid, int userid, int matchidx) async {
    //기본 값은 증가
    int incValue=-1;
    if(isstate) {
        incValue = 1;
        print('참석');
      }
    else{
      incValue = -1;
      print('불참');
    }
    try {
      var query = FirebaseFirestore.instance.collection('matchinfo').where('idx', isEqualTo: matchidx)
          .where('team1_id', isEqualTo: teamid);

      // Get the query results
      var querySnapshot = await query.get();

      // Update the 'attendanced_count' field of each matching document
      querySnapshot.docs.forEach((doc) {
        doc.reference.update({'attendanced_count': FieldValue.increment(incValue)});
      });

      print('attendanced_count updated successfully!');
    } catch (e) {
      print('Error updating documents: $e');
    }
  }
  static Future<void> upsertAttendance_info(bool state, int teamid, int userid, int matchidx) async {
    //기본 값은 증가
    int incValue=-1;
    DateTime now = DateTime.now();
    if(state) {
      incValue = 1;
      print('참석');
    }
    else{
      incValue = -1;
      print('불참');
    }
    try {
      // Create a query to retrieve documents where the 'age' field is less than 30
      var query = FirebaseFirestore.instance.collection('match_attendance').where('idx', isEqualTo: matchidx)
          .where('team1_id', isEqualTo: teamid)
          .where('user_id', isEqualTo: userid);

      // Get the query results
      var querySnapshot = await query.get();

      //동일한 Device에 ID의 데이터가 없는 경우 신규 생성한다.
      //만약 사용자가 동일 ID로 다른 기기에서 로그인하면... 중복 입력되므로... 수정 필요!
      if(querySnapshot.docs.length ==0) {
        //Insert The new document
        Map<String, dynamic> attendanceCheckInfo = {
          "attendance_check": incValue,
          "idx" : matchidx,
          "team1_id" : teamid,
          "checked_date":DateTime.now(),
          "user_id": userid
        };
        String id = generateId();
        FirebaseFirestore.instance.collection('match_attendance').doc(id).set(attendanceCheckInfo);
      }
      else {
        // Update the 'attendance_check' field of each matching document
        querySnapshot.docs.forEach((doc) {
          doc.reference.update({'attendance_check': incValue});
        });
      }

      print('attendanced_count updated successfully!');
    } catch (e) {
      print('Error updating documents: $e');
    }
  }
}

