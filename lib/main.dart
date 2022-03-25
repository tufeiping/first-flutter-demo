import 'package:first_flutter/detialpage.dart';
import 'package:first_flutter/utils/index.dart';
import 'package:flutter/material.dart';
import 'package:webfeed/webfeed.dart';

import 'package:first_flutter/nav/navdrawer.dart';
import 'package:first_flutter/utils/receiver.dart';

const String rssURL = 'https://www.chinanews.com.cn/rss/scroll-news.xml';
const String navTitle = '中国新闻网';
const String appTitle = navTitle + '客户端';

void main() {
  runApp(const MyNewsApp());
}

class MyNewsApp extends StatelessWidget {
  const MyNewsApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const NewListPage(title: navTitle),
    );
  }
}

class NewListPage extends StatefulWidget {
  const NewListPage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<NewListPage> createState() => _NewListPageState();
}

class _NewListPageState extends State<NewListPage> {
  List<RssItem> rssItems = [];

  void _refresh() async {
    try {
      var _rssItems = await getRssItems(rssURL);
      setState(() {
        // This call to setState tells the Flutter framework that something has
        // changed in this State, which causes it to rerun the build method below
        // so that the display can reflect the updated values. If we changed
        // _counter without calling setState(), then the build method would not be
        // called again, and so nothing would appear to happen.
        rssItems = _rssItems;
      });
    } catch (e) {
      showAlert(context, '异常', e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    _refresh();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: NavDrawer(),
      ),
      body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: ListView(children: _buildRssItems(rssItems))),
      floatingActionButton: FloatingActionButton(
        onPressed: _refresh,
        tooltip: 'Refresh',
        child: const Icon(Icons.wifi_protected_setup),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  List<Widget> _buildRssItems(List<RssItem> items) {
    List<Widget> result = [];
    result = items
        .map((e) {
          var widget = ListTile(
              leading: const Icon(Icons.add_road_sharp),
              title: Text(safeString(e.title)),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailPage(item: e)));
              });
          return widget as Widget;
        })
        .cast<Widget>()
        .toList();
    return result;
  }
}
