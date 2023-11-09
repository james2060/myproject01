import 'package:flutter/material.dart';
import 'package:myproject01/apptheme.dart';
import 'package:myproject01/model/match_model.dart';
import 'package:myproject01/blocs/Matchbloc.dart';
import 'package:myproject01/screen/authentication/sign_in_screen.dart';
import 'package:badges/badges.dart' as badges;
import 'package:myproject01/utils/popup_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
class NexMatchDetails extends StatefulWidget {
  final AnimationController? animationController;

  const NexMatchDetails({super.key, required this.title,this.animationController});
  final String title;

  @override
  void dispose(){
    bloc.dispose();
  }
  @override
  State<NexMatchDetails> createState() => _NexMatchDetailsState();
}
class _NexMatchDetailsState extends State<NexMatchDetails> {

  Animation<double>? topBarAnimation;
  String club_name = 'Greens';

  List<Widget> listViews = <Widget>[];
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = 0.0;


  @override
  void initState() {

    debugPrint("_NexMatchDetailsState - initState");
    topBarAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: widget.animationController!,
            curve: Interval(0, 0.5, curve: Curves.fastOutSlowIn)));

    //addAllListData();

    scrollController.addListener(() {
      if (scrollController.offset >= 24) {
        if (topBarOpacity != 1.0) {
          setState(() {
            topBarOpacity = 1.0;
          });
        }
      } else if (scrollController.offset <= 24 &&
          scrollController.offset >= 0) {
        if (topBarOpacity != scrollController.offset / 24) {
          setState(() {
            topBarOpacity = scrollController.offset / 24;
          });
        }
      } else if (scrollController.offset <= 0) {
        if (topBarOpacity != 0.0) {
          setState(() {
            topBarOpacity = 0.0;
          });
        }
      }
    });
    //addSampleMatchInfo();
    super.initState();
  }
  Widget getAppBarUI() {
    return Column(
      children: <Widget>[
        AnimatedBuilder(
          animation: widget.animationController!,
          builder: (BuildContext context, Widget? child) {
            return FadeTransition(
              opacity: topBarAnimation!,
              child: Transform(
                transform: Matrix4.translationValues(
                    0.0, 30 * (1.0 - topBarAnimation!.value), 0.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: apptheme.white.withOpacity(topBarOpacity),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(32.0),
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: apptheme.grey
                              .withOpacity(0.4 * topBarOpacity),
                          offset: const Offset(1.1, 1.1),
                          blurRadius: 10.0),
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: MediaQuery.of(context).padding.top,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 16,
                            right: 16,
                            top: 16 - 8.0 * topBarOpacity,
                            bottom: 12 - 8.0 * topBarOpacity),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  club_name,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: apptheme.fontName,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 22 + 6 - 6 * topBarOpacity,
                                    letterSpacing: 1.2,
                                    color: apptheme.darkerText,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 38,
                              width: 38,
                              child: InkWell(
                                highlightColor: Colors.transparent,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(32.0)),
                                onTap: () {},
                                child: Center(
                                  child: badges.Badge(
                                    position: badges.BadgePosition.topEnd(top: 0, end: 3),
                                    badgeAnimation: badges.BadgeAnimation.slide(
                                    ),
                                    badgeStyle: badges.BadgeStyle(
                                      badgeColor: Colors.redAccent,
                                    ),
                                    badgeContent: Text(
                                      //notification count 표시
                                      "1",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    child: IconButton(icon: Icon(Icons.notifications),
                                        onPressed: () {
                                          //스크린을 이동해서 사용자가 알림을 확인한다.
                                          //읽은 것만 카운팅해서 없애야 한다.
                                        }),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 8,
                                right: 8,
                              ),
                              child: Row(
                                children: <Widget>[
                                ],
                              ),
                            ),
                            //로그아웃 버튼 클릭 시 SignInScreen 페이지로 이동
                            SizedBox(
                              height: 38,
                              width: 38,
                              child: InkWell(
                                highlightColor: Colors.transparent,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(32.0)),
                                onTap: () async {

                                  bool result = await showAlertDialog(context, "로그아웃 하시겠습니까?", "");
                                  if(result){
                                    await FirebaseAuth.instance.signOut();
                                    // Get.to(SignInScreen());
                                    Get.offAll(SignInScreen());
                                    debugPrint("FirebaseAuth sign out...");
                                  }
                                  else{
                                    debugPrint("Cancel to logout...");
                                  }
                                  if (!mounted) return;
                                },
                                child: Center(
                                  child: Icon(
                                    Icons.logout,
                                    color: apptheme.grey,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    bloc.fetchAllMatch();

    return Scaffold(

          backgroundColor: Colors.transparent,
          body: Stack(
            children: <Widget>[
              StreamBuilder<List<MatchSchedule>>(
                //모든 경기 리스트를 가져온다.
                stream: bloc.allMatch,
                builder: (context, AsyncSnapshot<List<MatchSchedule>> snapshot) {
                  if (snapshot.hasData) {
                    return buildList(snapshot);
                  } else if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
              getAppBarUI(),
              SizedBox(height: MediaQuery.of(context).padding.bottom,)
            ],
          )
    );
  }
  //데이터를 그리드뷰에 출력하는 함수
  Widget buildList(AsyncSnapshot<List<MatchSchedule>> snapshot) {

    List<MatchSchedule> matchlist=snapshot.data!;

    return FutureBuilder<bool>(

      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        Text('Matchs',
            style: TextStyle(
              fontFamily: "Open Sans",
              color: Color(0xff000000),
              fontSize: 12,
            ));
        return ListView.builder(
          controller: scrollController,
          padding: EdgeInsets.only(
            top: AppBar().preferredSize.height +
                MediaQuery.of(context).padding.top +
                24,
            bottom: 62 + MediaQuery.of(context).padding.bottom,
          ),
          itemCount: matchlist.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            widget.animationController?.forward();

            return Card(
                color: Color(0xfff3f3f3),
                shadowColor: Color(0x07000000),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 10),
                    ListTile(
                      leading: FlutterLogo(size: 72.0),
                      title: Text(matchlist[index].matchinfo!.starttime.toString()!),
                      subtitle: Text(matchlist[index].matchinfo!.team1Name!),
                      trailing: Icon(Icons.more_vert),
                      isThreeLine: true,
                      //dense: true,
                    ),
                   ],
                ),
            );
          },
        );
      },
    );
  }
  //경기 일정 샘플 등록
  void addSampleMatchInfo(){
    DateTime dt = DateTime(2023, 11, 4);
    DateTime dt2 = dt.add(Duration(days: 7));
    for(int i=0; i <10; i++) {
      var date;
      if(i == 0)
        date = dt2.year.toString() + dt2.month.toString()+dt2.day.toString();
      else
        dt2 = dt2.add(Duration(days:7));
      date = dt2.year.toString() + dt2.month.toString()+dt2.day.toString();
      debugPrint(date);
      bloc.addMatchinfo(date);
    }
  }

}