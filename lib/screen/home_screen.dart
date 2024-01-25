import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myproject01/apptheme.dart';
import 'package:myproject01/model/bottom_tab_icon_data.dart';
import 'package:myproject01/screen/bottombar_navigation.dart';
import 'package:myproject01/screen/home_body/home_body_main.dart';
import 'package:myproject01/screen/next_match_details_screen.dart';
import 'package:get/get.dart';
import 'package:myproject01/repository/globaldata.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required User user})
      : _user = user,
        super(key: key);
  final User _user;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with TickerProviderStateMixin {
  AnimationController? animationController;

  List<TabIconData> tabIconsList = TabIconData.tabIconsList;

  Widget tabBody = Container(
    color: apptheme.background,
  );

  @override
  void initState() {
    tabIconsList.forEach((TabIconData tab){
          tab.isSelected = false;
      });
      //맨 처음 아이콘은 선택 되어 있다.
      tabIconsList[0].isSelected = true;

      animationController = AnimationController(duration: const Duration(microseconds: 600), vsync: this);
      tabBody = HomeBodyMain(animationController: animationController);

    super.initState();
  }
  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('home screen');
    return  Scaffold(
      body: Stack(
        children: <Widget>[
          tabBody,
          bottomBar(),
        ],
      ),
    );
  }

  Widget bottomBar() {
    return Column(
      children: <Widget>[
        const Expanded(
          child: SizedBox(),
        ),
        BottomBarView(
          tabIconsList: tabIconsList,
          addClick: () {},
          changeIndex: (int index) {
            //Home
            if (index == 0) {
              //gd.setNewMatch();
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  debugPrint('index == 0  mount is false');
                  return;
                }
                setState(() {
                  debugPrint('index == 0');
                  tabBody = HomeBodyMain(animationController: animationController);
                });
              });
            } else if (index == 1) {
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  debugPrint('index == 1 mount is false');
                  return;
                }
                setState(() {
                  tabBody = NexMatchDetails(title: 'MatchList',animationController: animationController);
                });
              });
            } else if (index == 2) {
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  debugPrint('index == 2 mount is null');
                  return;
                }
                setState(() {
                  debugPrint('index == 2');
                  //tabBody = TrainingScreen(animationController: animationController);
                });
              });
            } else if (index == 3) {
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  debugPrint('index == 3 mount is null');
                  return;
                }
                setState(() {
                  debugPrint('index == 3');
                  //tabBody = TrainingScreen(animationController: animationController);
                });
              });
            }
          },
        ),
      ],
    );
  }
}