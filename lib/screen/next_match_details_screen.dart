import 'package:flutter/material.dart';
import 'package:myproject01/apptheme.dart';
import 'package:myproject01/model/match_model.dart';
import 'package:myproject01/blocs/Matchbloc.dart';

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

    debugPrint("HomeMatchSummeryState - initState");
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bloc.fetchAllMatch();

    return Scaffold(
      appBar: AppBar(
        title: Text('Management'),
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.refresh), onPressed: (){
          bloc.fetchAllMatch();
        }),
        actions: [
          IconButton(icon: Icon(Icons.add_task), onPressed: (){

          }),
          IconButton(icon: Icon(Icons.add_moderator), onPressed: null),
        ],
      ),
      body: StreamBuilder<List<MatchSchedule>>(
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
    );
  }
  //데이터를 그리드뷰에 출력하는 함수
  Widget buildList(AsyncSnapshot<List<MatchSchedule>> snapshot) {

    // List<MatchSchedule> matchlist=snapshot.data!;
    //
    // return ListView.builder(
    //   itemCount:matchlist.length,
    //   itemBuilder: (context,index){
    //     return ListTile(
    //       title: Text(matchlist[index].matchinfo!.starttime.toString()!),
    //       subtitle: Text(matchlist[index].matchinfo!.team1!),
    //     );
    //   },
    // );

    List<MatchSchedule> matchlist=snapshot.data!;

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
          itemCount: matchlist.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            widget.animationController?.forward();
            return ListTile(
              title: Text(matchlist[index].matchinfo!.starttime.toString()!),
              subtitle: Text(matchlist[index].matchinfo!.team1Name!),
            );
          },
        );
      },
    );
  }
}