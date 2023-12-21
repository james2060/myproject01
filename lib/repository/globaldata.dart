import 'package:firebase_auth/firebase_auth.dart';
import 'package:myproject01/TestCrud.dart';
//전역 데이터
class GlobalData{
  //Push message count
  var g_notiCount = 0;
  //로그인 사용자 정보
  User? g_user;

  void setUser(User? _user){
    this.g_user = _user;
  }
  void removeUser(){
    this.g_user = null;
  }
  void addNotiCount(){
    this.g_notiCount = g_notiCount + 1;
    print("count: $g_notiCount");
  }
  String getNotiCountString(){
    if(this.g_notiCount > 0)
      return g_notiCount.toString();
    else
      return "";
  }
  int getNotiCountInt(){
    return this.g_notiCount;
  }
  int setNotiCountInt(int count)
  {
    if(this.g_notiCount > 0)
      this.g_notiCount = this.g_notiCount - count;
    else
      this.g_notiCount = 0;

    return this.g_notiCount;
  }
  void setNewMatch() {
    TestCrud? test = TestCrud();
    test.SetNewMatch();
  }
}
GlobalData gd = GlobalData();

enum Viewtype {next_scehdule_detail, news_detail}