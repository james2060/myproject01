import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myproject01/model/team_model.dart';
import 'package:myproject01/model/match_model.dart';
import 'package:myproject01/model/user_model.dart';

FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

class FirestoreDb{

  //팀 등록
  void addToTeam(String collectionName, String docName,TeamProfile teamProfile) async {
    await _firebaseFirestore.collection(collectionName).doc(docName)
        .set( teamProfile.toJson());
  }

  //사용자 정보 추가
  void addToUser(String uid, String collectionName, String docName, User user) async {
    await _firebaseFirestore.collection(collectionName).doc(docName)
        .set(user.toJson());
  }

  //경기 일정 등록
  void addToMatch(String teamid, String collectionName, String docName, MatchSchedule matchSchedule) async {
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
}