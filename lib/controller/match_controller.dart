import 'package:get/get.dart';
import 'package:myproject01/model/match_model.dart';
import 'package:myproject01/repository/firebase_store/firestore_db.dart';

class MatchController extends GetxController {
  //static TeamController instance = Get.find();
  //late Rx<TeamProfile?> _team;

  final matchlist = <MatchSchedule>[].obs;
  var teamid;

  void updateteamID(var teamID){
    teamid = teamID;
  }
  void onInit() {
    super.onInit();
    fetchMatchData(this.teamid);
  }
  void fetchMatchData(var teamid) async{
    var matches = await FirestoreDb.fetchMatchList(teamid);
    if(matches != null){
      matchlist.value = matches;
    }
  }
}
