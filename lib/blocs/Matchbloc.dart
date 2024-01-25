import 'package:myproject01/model/match_model.dart';

import 'package:myproject01/repository/resource/repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:myproject01/model/match_model.dart';

class MatchBloc {
  final _repository = Repository();
  final _matchinfoFetcher = PublishSubject<List<MatchSchedule>>();

  Stream<List<MatchSchedule>> get allMatch => _matchinfoFetcher.stream;

  fetchAllMatch() async {
    List<MatchSchedule> matchInfoModel = await _repository.fetchAllMatchInfo();
    _matchinfoFetcher.sink.add(matchInfoModel);
  }

  addMatchinfo(String date) async {
    await _repository.addMatchInfo(date);
  }
  dispose() {
    _matchinfoFetcher.close();
  }
}

final bloc = MatchBloc();