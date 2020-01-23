import 'package:flutter/material.dart';

import 'package:youtube_favorites/api.dart';
import 'package:youtube_favorites/blocs/favorite_bloc.dart';
import 'package:youtube_favorites/blocs/videos_bloc.dart';
import 'package:youtube_favorites/delegates/data_search.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:youtube_favorites/models/video.dart';
import 'package:youtube_favorites/screens/favorites.dart';
import 'package:youtube_favorites/widgets/video_tile.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Api api = Api();
    List<Video> videos;
    final bloc = BlocProvider.of<VideosBloc>(context);

    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: Container(
          height: 120,
          width: 140,
          child: Image.asset(
            "images/youtube_logo.png",
            fit: BoxFit.cover,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.black87,
        actions: <Widget>[
          Align(
            alignment: Alignment.center,
            child: StreamBuilder<Map<String, Video>>(
              stream: BlocProvider.of<FavoriteBloc>(context).outFav,
              initialData: {},
              builder: (context, snapshot) {
                if (snapshot.hasData)
                  return Text("${snapshot.data.length}");
                else
                  return Container();
              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.star),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => Favorites()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              String result = await showSearch(
                context: context,
                delegate: DataSearch(),
              );
              if (result != null) bloc.inSearch.add(result);
            },
          ),
        ],
      ),
      body: StreamBuilder(
        stream: bloc.outVideos,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (context, index) {
                if (index < snapshot.data.length) {
                  return VideoTile(
                    snapshot.data[index],
                  );
                } else if (index > 1) {
                  bloc.inSearch.add(null);
                  return Container(
                    height: 40.0,
                    width: 40.0,
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                    ),
                  );
                } else {
                  return Container();
                }
              },
              itemCount: snapshot.data.length + 1,
            );
          } else {
            return ListView.builder(
              itemBuilder: (context, index) {
                return FutureBuilder<List<Video>>(
                  future: api.trending(),
                  initialData: [],
                  builder: (context, snapshot) {
                    if (snapshot.hasData)
                      return VideoTile(null);
                    else
                      return Container();
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
