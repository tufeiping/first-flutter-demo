import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webfeed/domain/rss_item.dart';

@immutable
class NewsDetailPage extends StatelessWidget {
  RssItem? _item;
  TextStyle fontStyle = const TextStyle(fontSize: 20);

  NewsDetailPage({Key? key, RssItem? item})
      : _item = item,
        super(key: key);

  void _launchURL() async {
    if (_item == null) return;
    var _url = (_item as RssItem).link;
    if (_url == null) return;
    if (!await launch(_url)) throw 'Could not launch $_url';
  }

  String parserDateTime(RssItem? rssItem) {
    if (rssItem == null) return "";
    var pubDate = rssItem.pubDate;
    if (pubDate == null) return "";
    String dateStr = pubDate.toString();
    return dateStr.substring(0, dateStr.length - 4) + " ";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the NewsDetailPage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text((_item == null ? "" : (_item as RssItem).title) as String),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MaterialButton(
              onPressed: _launchURL,
              child: Text(
                  (_item == null ? "" : (_item as RssItem).link) as String),
            ),
            Text(
              (_item == null ? "" : (_item as RssItem).description) as String,
              style: fontStyle,
              maxLines: 30,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                parserDateTime(_item),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
