import 'package:flutter/material.dart';
import 'package:flist/page_list.dart';
import 'package:flutterdemo/pages/pages.dart';
import 'package:darequest/request.dart';


const String HOST = 'http://192.168.70.12:8082';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController controller;

  int page = 0;


  @override
  void initState() {
    super.initState();
    Request.interceptor.config = (config) {
      config.url = HOST + config.url;
      return config;
    };
    this.controller = new PageController(initialPage: page);
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
      appBar: new AppBar(title: new Text('M'),),
      body: new PageView(
        children: <Widget>[new Music(), new Play(), new Me()],
        controller: this.controller,
      ),
      bottomNavigationBar: new BottomNavigationBar(
        items: [
          new BottomNavigationBarItem(icon: new Icon(Icons.music_note), title: new Text('MUSIC')),
          new BottomNavigationBarItem(icon: new Icon(Icons.play_arrow), title: new Text('PLAY')),
          new BottomNavigationBarItem(icon: new Icon(Icons.person), title: new Text('ME'))
        ],
        currentIndex: page,
        onTap: onTap,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  void onTap(int index) {
    this.controller.animateToPage(index, duration: const Duration(milliseconds: 300),
        curve: Curves.ease).then((data) => this.onPageChange(index));
  }

  void onPageChange(page) {
    setState(() {
      this.page = page;
    });
  }
}
