import 'package:flutter/material.dart';
import 'package:myproject01/apptheme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:badges/badges.dart' as badges;
import 'package:get/get.dart';
import 'package:myproject01/screen/authentication/sign_in_screen.dart';
import 'package:myproject01/screen/home_body/news_summary_view.dart';
import 'package:myproject01/screen/home_body/title_view.dart';
import 'package:myproject01/utils/popup_dialog.dart';
import 'package:myproject01/screen/home_body/next_match_summary_view.dart';
import 'package:myproject01/screen/home_body/team_summary_view.dart';
import 'package:myproject01/screen/home_body/my_summary_view.dart';
import 'package:myproject01/controller/match_controller.dart';
import 'package:myproject01/repository/globaldata.dart';

class HomeBodyMain extends StatefulWidget {

  const HomeBodyMain({this.animationController});

    final AnimationController? animationController;

  @override
  _HomeBodyMainState createState() => _HomeBodyMainState();
}

class _HomeBodyMainState extends State<HomeBodyMain> with TickerProviderStateMixin {

  Animation<double>? topBarAnimation;
  String club_name = 'Greens';

  List<Widget> listViews = <Widget>[];
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = 0.0;


  @override
  void initState() {

    debugPrint("HomeMatchSummeryState - initState");
    topBarAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: widget.animationController!,
            curve: Interval(0, 0.5, curve: Curves.fastOutSlowIn)));

    addAllListData();

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
    super.initState();
  }
  void addAllListData(){
    const int count =  4;
    //--------------------------------
    //Next Matches
    //--------------------------------
    listViews.add(
        TitleView(
          viewtype: Viewtype.next_scehdule_detail,
          titleTxt: 'Next Match',
          subTxt: 'Details',
          animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
              parent: widget.animationController!,
              curve:
              Interval((1 / count) * 4, 1.0, curve: Curves.fastOutSlowIn))),
          animationController: widget.animationController!,
        )
    );
    listViews.add(
      NextMatchView(
          animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
              parent: widget.animationController!,
              curve:
              Interval((1 / count) * 1, 1.0, curve: Curves.fastOutSlowIn))),
          animationController: widget.animationController!
      ),
    );
    //--------------------------------
    //Team
    //--------------------------------
    listViews.add(
        TitleView(
          viewtype: Viewtype.news_detail,
          titleTxt: 'Team',
          subTxt: 'Details',
          animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
              parent: widget.animationController!,
              curve:
              Interval((1 / count) * 4, 1.0, curve: Curves.fastOutSlowIn))),
          animationController: widget.animationController!,
        )
    );
    listViews.add(
      TeamSummaryView(
          animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
              parent: widget.animationController!,
              curve:
              Interval((1 / count) * 1, 1.0, curve: Curves.fastOutSlowIn))),
          animationController: widget.animationController!
      ),
    );
    //--------------------------------
    //News
    //--------------------------------
    listViews.add(
        TitleView(
          viewtype: Viewtype.news_detail,
          titleTxt: 'News',
          subTxt: 'Details',
          animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
              parent: widget.animationController!,
              curve:
              Interval((1 / count) * 4, 1.0, curve: Curves.fastOutSlowIn))),
          animationController: widget.animationController!,
        )
    );
    listViews.add(
      NewsSummaryView(
          animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
              parent: widget.animationController!,
              curve:
              Interval((1 / count) * 1, 1.0, curve: Curves.fastOutSlowIn))),
          animationController: widget.animationController!
      ),
    );
    //--------------------------------
    //My Stats
    //--------------------------------
    listViews.add(
        TitleView(
          viewtype: Viewtype.news_detail,
          titleTxt: 'My',
          subTxt: 'Details',
          animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
              parent: widget.animationController!,
              curve:
              Interval((1 / count) * 4, 1.0, curve: Curves.fastOutSlowIn))),
          animationController: widget.animationController!,
        )
    );
    listViews.add(
      MySummaryView(
          animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
              parent: widget.animationController!,
              curve:
              Interval((1 / count) * 1, 1.0, curve: Curves.fastOutSlowIn))),
          animationController: widget.animationController!
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        color: apptheme.background,
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              children: <Widget>[
                getMainListViewUI(),
                getAppBarUI(),
                SizedBox(height: MediaQuery.of(context).padding.bottom,)
              ],
            )
        )
    );
  }
  Widget getMainListViewUI() {
    return FutureBuilder<bool>(
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          return ListView.builder(
            controller: scrollController,
            padding: EdgeInsets.only(
              top: AppBar().preferredSize.height +
                  MediaQuery.of(context).padding.top +
                  24,
              bottom: 62 + MediaQuery.of(context).padding.bottom,
            ),
            itemCount: listViews.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              widget.animationController?.forward();
              return listViews[index];
            },
          );

      },
    );
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
}