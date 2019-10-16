import 'package:flutter/material.dart';
import 'package:flutter_animations/screens/home/widgets/list_data.dart';

class AnimatedListView extends StatelessWidget {
  final Animation<EdgeInsets> listSlidePosition;

  AnimatedListView({@required this.listSlidePosition});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        ListData(
          title: "Estudar Flutter",
          subtitle: "Na udemy",
          image: AssetImage("images/perfil.jpg"),
          margin: listSlidePosition.value * 1.0,
        ),
        ListData(
          title: "Estudar Flutter 2",
          subtitle: "Na udemy",
          image: AssetImage("images/perfil.jpg"),
          margin: listSlidePosition.value * 0.0,
        ),
      ],
    );
  }
}
