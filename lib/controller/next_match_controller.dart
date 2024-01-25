import 'package:get/get.dart';
import 'package:myproject01/model/match_model.dart';
import 'package:myproject01/repository/firebase_store/firestore_db.dart';

class NextMatchController extends GetxController {

  Rx<MatchSchedule?> nextmatch = Rx<MatchSchedule?>(null);

  void onInit() {
    super.onInit();
    fetchNextMatch();
  }
  void fetchNextMatch() async{
    nextmatch.value = await FirestoreDb.fetchNextMatch();
  }
}
