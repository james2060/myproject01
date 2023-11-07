import 'dart:async';
import 'dart:convert';
import 'package:myproject01/model/match_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MatchApiProvider {

  List<MatchSchedule> ms = [];

  Future<List<MatchSchedule> > fetchMatchList() async {
    CollectionReference<Map<String, dynamic>> collectionReference = FirebaseFirestore.instance.collection("matchinfo");
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await collectionReference.orderBy("date",descending: true)
        .get();

    ms.clear();
    for( var document in querySnapshot.docs) {
      ms.add(MatchSchedule.fromJson(document.data()));
    }
    var itemcount = ms.length;

    print("match list size: $itemcount");

    return ms;
  }

}