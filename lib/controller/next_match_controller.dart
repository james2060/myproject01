import 'package:get/get.dart';
import 'package:myproject01/model/match_model.dart';
import 'package:myproject01/repository/firebase_store/firestore_db.dart';
import 'package:myproject01/controller/relative_record.dart';
import 'package:flutter/foundation.dart';
class NextMatchController extends GetxController {

  Rx<MatchSchedule?> nextmatch = Rx<MatchSchedule?>(null);
  Rx<RelativeRecord?> record = Rx<RelativeRecord?>(null);

  void onInit() {
    super.onInit();
    fetchNextMatch();
  }
  void fetchNextMatch() async{
    nextmatch.value = await FirestoreDb.fetchNextMatch();
    record.value = await FirestoreDb.fetchRelativeRecord(1, 2);
  }
}
