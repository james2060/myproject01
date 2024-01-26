import 'package:get/get.dart';
import 'package:myproject01/model/match_model.dart';
import 'package:myproject01/repository/firebase_store/firestore_db.dart';
import 'package:myproject01/controller/relative_record.dart';

class NextMatchController extends GetxController {

  Rx<MatchSchedule?> nextmatch = Rx<MatchSchedule?>(null);
  Rx<RelativeRecord?> record = Rx<RelativeRecord?>(null);
  RxInt win = 0.obs;
  RxInt draw = 0.obs;
  RxInt lose = 0.obs;

  void onInit() {
    super.onInit();
    fetchNextMatch();
  }
  void fetchNextMatch() async{
    nextmatch.value = await FirestoreDb.fetchNextMatch();
    win = await FirestoreDb.fetchRelativeRecordWin(1, 2, 1);

  }
}
