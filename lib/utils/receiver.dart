import 'package:dio/dio.dart';
import 'package:webfeed/webfeed.dart';

const int RETRIVE_TIMEOUT = 300000;
const int CONNECT_TIMEOUT = 5000;

Future<List<RssItem>> getRssItems(String url) async {
  try {
    var options = BaseOptions(
      connectTimeout: CONNECT_TIMEOUT,
      receiveTimeout: RETRIVE_TIMEOUT,
    );
    var response = await Dio(options).get(url);
    var rssFeed = RssFeed.parse(response.data.toString());
    return rssFeed.items as List<RssItem>;
  } catch (e) {
    throw '请求出现异常 [' + e.toString() + ']';
  }
  return [];
}
