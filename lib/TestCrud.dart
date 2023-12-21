import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:myproject01/screen/authentication/sign_in_screen.dart';
import 'package:myproject01/utils/constants.dart';
import 'package:get/get.dart';
import 'package:myproject01/controller/auth_controller.dart';
import 'package:myproject01/controller/match_controller.dart';
import 'package:myproject01/screen/authentication/user_info_screen.dart';
import 'package:myproject01/screen/authentication/register_screen.dart';
import 'package:myproject01/screen/next_match_details_screen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:myproject01/repository/firebase_store/firebase_functions.dart';

Map<String, dynamic> matchschedule = {

    "idx" : 1000,
    "team1_id" : 1,
    "team2_id" : 2,
    "starttime":"2023-12-31 07:00:00",
    "endtime" :  "2023-12-31 09:00:00",
    "location":"서울디지털운동장",
    "team1_name": "GridFC",
    "team2_name": "스트레인져스",
    "team1_score": 0,
    "team2_score": 0,
    "result" : 1,
    "attendancd_count": 13,
    "nonappearance_count": 13
};
class TestCrud{
  TestCrud();
  void SetNewMatch(){

    FirebaseFunctions ff = FirebaseFunctions();
    ff.setDataToFbs("matchinfo", matchschedule);
  }

}

