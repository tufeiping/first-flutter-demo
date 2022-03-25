import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webfeed/domain/rss_item.dart';

class DetailPage extends StatelessWidget {
  var _item;

  DetailPage({Key? key, RssItem? item})
      : _item = item,
        super(key: key);

  void _launchURL() async {
    var _url = _item.link;
    if (!await launch(_url)) throw 'Could not launch $_url';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(_item.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MaterialButton(
              onPressed: _launchURL,
              child: Text(_item.link),
            ),
            Text(_item.description),
          ],
        ),
      ),
    );
  }
}
