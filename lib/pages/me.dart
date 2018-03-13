import 'package:flutter/material.dart';


class Me extends StatefulWidget {
  @override
  State<StatefulWidget> createState()  => new MeState();
}

class MeState extends State<Me> {
  @override
  Widget build(BuildContext context) {
    return new Container(child: new Center(child: new Text('Me'),), color: Colors.white30,);
  }
}