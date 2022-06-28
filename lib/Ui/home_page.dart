import 'package:flutter/material.dart';
import 'package:netflix/Ui/contentheader.dart';
import 'package:netflix/Ui/customappbar.dart';
import 'package:netflix/widgets/top_rated.dart';
import 'package:netflix/widgets/trending_movies.dart';
import 'package:netflix/widgets/tv.dart';
import 'package:netflix/widgets/up_coming.dart';
import 'package:tmdb_api/tmdb_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List trendingmovies = [];
  List topratedmovies = [];
  List tv = [];
  List upcomingmovoies = [];
  final String apikey = '131fe0432d3f7fe3525431482f9c8708';
  final readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxMzFmZTA0MzJkM2Y3ZmUzNTI1NDMxNDgyZjljODcwOCIsInN1YiI6IjYyYWQ3ZmNmNWIxMjQwMDA1NWVlNWZiYiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ZbKyJzAVB5EH8YN0dTArZXCSVEtSfbyBQlWxPU1v2ZA';

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apikey, readaccesstoken),
        logConfig: const ConfigLogger(showLogs: true, showErrorLogs: true));
    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvresult = await tmdbWithCustomLogs.v3.tv.getPopular();
    Map upcomingresult = await tmdbWithCustomLogs.v3.movies.getUpcoming();

    setState(() {
      trendingmovies = trendingresult['results'];
      topratedmovies = topratedresult['results'];
      tv = tvresult['results'];
      upcomingmovoies = upcomingresult['results'];
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
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        // backgroundColor: Colors.grey[850],
        backgroundColor: Colors.white,
        child: Icon(
          Icons.shuffle,
          color: Colors.red.shade600,
        ),
      ),
      appBar: PreferredSize(
        preferredSize: Size(ScreenSize.width, 50.0),
        child: CustomAppBar(
          scrollOffset: scrollOffset,
        ),
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          const SliverToBoxAdapter(child: ContentHeader()),
          const SliverPadding(padding: EdgeInsets.only(top: 20.0)),
          SliverToBoxAdapter(
            child: Tvmost(tv: tv),
          ),
          const SliverPadding(padding: EdgeInsets.only(top: 5.0)),
          SliverToBoxAdapter(
            child: Trendingmovies(trending: trendingmovies),
          ),
          const SliverPadding(padding: EdgeInsets.only(top: 5.0)),
          SliverToBoxAdapter(
            child: Topratedmovies(toprated: topratedmovies),
          ),
          const SliverPadding(padding: EdgeInsets.only(top: 5.0)),
          SliverToBoxAdapter(
            child: Upcomingmovies(upcoming: upcomingmovoies),
          ),
        ],
      ),
    );
  }
}
