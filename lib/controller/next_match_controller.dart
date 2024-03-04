import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:myproject01/model/match_model.dart';
import 'package:myproject01/repository/firebase_store/firestore_db.dart';
import 'package:myproject01/model/relative_record.dart';
import 'package:flutter/foundation.dart';
class NextMatchController extends GetxController {

  Rx<MatchSchedule?> nextmatch = Rx<MatchSchedule?>(null);
  Rx<RelativeRecord?> record = Rx<RelativeRecord?>(null);

  void onInit() {
    super.onInit();
    fetchNextMatch();
  }
  void fetchNextMatch() async{
    //Comming Next Match
    nextmatch.value = await FirestoreDb.fetchNextMatch();
    //상대 전적
    record.value = await FirestoreDb.fetchRelativeRecord(1, 2);
  }
  //참석 여부 업데이트
  void updateAttendance(bool isstate, int teamid, int userid, int matchidx) async{
    await FirestoreDb.updateAttendance(isstate,teamid,userid,matchidx);
  }
  //참석여부 정보 업데이트
  void upsertAttendance_info(bool state, int teamid, int userid, int matchidx) async {
    await FirestoreDb.upsertAttendance_info(state,teamid,userid,matchidx);
  }
}
