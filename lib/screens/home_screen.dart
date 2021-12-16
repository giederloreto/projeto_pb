import 'package:flutter/material.dart';
import 'package:projeto_pb/components/trending.dart';
import 'package:tmdb_api/tmdb_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List trendingmovies = [];

  final String apikey = "66efbc171cd29e93fa8c3ed29e8b268d";
  final readacesstoken =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2NmVmYmMxNzFjZDI5ZTkzZmE4YzNlZDI5ZThiMjY4ZCIsInN1YiI6IjYxYjllMTJiZDE0NDQzMDA2Njk2ZWY4MCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.qPMfzNN9c0kZAvwDUnfDEvd0JmHLC4iZbSA3EbxtAwc";

  @override
  void initState() {
    loadmovies();
    super.initState();
  }

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apikey, readacesstoken),
        logConfig: ConfigLogger(
          showLogs: true,
          showErrorLogs: true,
        ));

    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();

    setState(() {
      trendingmovies = trendingresult['results'];
    });
    print(trendingmovies);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          alignment: Alignment.center,
        ),
        title: Container(
          height: 50,
          child: TextFormField(
            textAlign: TextAlign.start,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                fillColor: Colors.grey,
                filled: true,
                hintText: "Pesquisar",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50))),
          ),
        ),
        actions: [
          IconButton(
            alignment: Alignment.centerLeft,
            color: Colors.red,
            onPressed: () {},
            icon: Icon(Icons.favorite),
          ),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.only(left: 5, right: 5, top: 10),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: [
            TrendingMovies(
              trending: trendingmovies,
            ),
          ],
        ),
      ),
    );
  }
}
