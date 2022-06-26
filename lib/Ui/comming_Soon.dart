import 'package:flutter/material.dart';
import 'package:netflix/widgets/Upcomingpagelist.dart';
import 'package:netflix/widgets/notifications.dart';
import 'package:tmdb_api/tmdb_api.dart';

class Commingsoon extends StatefulWidget {
  const Commingsoon({Key? key}) : super(key: key);

  @override
  State<Commingsoon> createState() => _CommingsoonState();
}

class _CommingsoonState extends State<Commingsoon> {

  List upcomingmovoies = [];
  final String apikey = '131fe0432d3f7fe3525431482f9c8708';
  final readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxMzFmZTA0MzJkM2Y3ZmUzNTI1NDMxNDgyZjljODcwOCIsInN1YiI6IjYyYWQ3ZmNmNWIxMjQwMDA1NWVlNWZiYiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ZbKyJzAVB5EH8YN0dTArZXCSVEtSfbyBQlWxPU1v2ZA';

        loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apikey, readaccesstoken),
    logConfig: const ConfigLogger(showLogs: true, showErrorLogs: true));
    Map upcomingresult = await tmdbWithCustomLogs.v3.movies.getUpcoming();

    setState(() {
      upcomingmovoies =  upcomingresult['results'];
    });
    print(upcomingmovoies);
  }
  
  late ScrollController _scrollController;
    double scrollOffset = 0.0;
  @override
  void initState() {
    loadmovies();
    //custom scrolbar//..
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          scrollOffset = _scrollController.offset;
        });
      });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final Size ScreenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text('Coming Soon', style: TextStyle(color: Colors.white,fontSize: 18),),
        actions: [
          IconButton(onPressed: (){}, 
          icon:const  Icon(Icons.search)),
          IconButton(onPressed: (){},
           icon:  const Icon(Icons.account_circle))
        ],
      ),
      body:CustomScrollView(
        controller: _scrollController,
        scrollDirection: Axis.vertical,
        slivers:  [
           const SliverToBoxAdapter(child:NotificationBar()),

           SliverToBoxAdapter(child:Upcomingmoviespage(upcoming: upcomingmovoies, ),)


        ],
      ),
    );
  }
}
