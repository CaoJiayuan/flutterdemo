import 'package:flutter/material.dart';


class Play extends StatefulWidget {
  @override
  State<StatefulWidget> createState()  => new PlayState();
}

class PlayState extends State<Play> {
  @override
  Widget build(BuildContext context) {
    return new Container(child: new Center(child: new Text('Play'),), color: Colors.green.shade400,);
  }
}