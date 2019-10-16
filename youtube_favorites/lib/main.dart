import 'package:flutter/material.dart';

import 'package:youtube_favorites/blocs/favorite_bloc.dart';
import 'package:youtube_favorites/blocs/videos_bloc.dart';
import 'package:youtube_favorites/screens/home.dart';
import 'package:bloc_pattern/bloc_pattern.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: VideosBloc(),
      child: BlocProvider(
        bloc: FavoriteBloc(),
        child: MaterialApp(
          title: "FlutterTube",
          home: Home(),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
