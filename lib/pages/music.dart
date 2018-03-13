import 'package:flutter/material.dart';


class Music extends StatefulWidget {
  @override
  State<StatefulWidget> createState()  => new MusicState();
}

class MusicState extends State<Music> {
  @override
  Widget build(BuildContext context) {
    return new Container(child: new Center(child: new Text('MUSIC'),), color: Colors.red.shade300,);
  }
}