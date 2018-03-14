import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterdemo/components/pagelist/lib/page_list.dart';


class Music extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new MusicState();
}

class MusicState extends State<Music> {
  @override
  Widget build(BuildContext context) {
    return new Container(child: new PageList(
      builder: new MusicListBuilder(),
    ));
  }
}

class MusicListBuilder extends ListBuilder{
  @override
  Paginator getPager() => new LengthAwarePaginator(url: '/api/article/newest');

  @override
  Widget noMore() => new Text('no more');

  @override
  Widget onCreateItem(BuildContext context, Map<String, Object> item, int index) {
    return new Column(children: <Widget>[
      new ListTile(leading: new CircleAvatar(backgroundImage: new NetworkImage(item['cover']),),title: new Text(item['title']),),
      new Divider()
    ],);
  }

  @override
  Widget onBuildList(BuildContext ctx) {
    var list = super.onBuildList(ctx);

    return new Scrollbar(child: list);
  }

  @override
  Map<String, dynamic> get params => {};
}
