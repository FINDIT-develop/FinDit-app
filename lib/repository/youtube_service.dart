import 'package:FinDit/models/statistics.dart';
import 'package:FinDit/models/search_video_result.dart';
import 'package:FinDit/models/youtuber.dart';
import 'package:get/get.dart';

class YoutubeService extends GetConnect {
  static YoutubeService get to => Get.find();

  @override
  void onInit() {
    httpClient.baseUrl = "https://www.googleapis.com/youtube/v3";
    super.onInit();
  }

  Future<YoutubeVideoResult?> loadVideos(
      String loadKeyword, String nextPageToken) async {
    String url =
        "/search?part=snippet&q=$loadKeyword&maxResults=10&order=date&type=video&videoDefinition=high&key=AIzaSyBTXPa0hTPLds9U1oCGBLaDs2jZ9_QLDWw";
    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.status);
    } else {
      if (response.body["items"] != null && response.body["items"].length > 0) {
        return YoutubeVideoResult.fromJson(response.body);
      }
    }
  }

  Future<YoutubeVideoResult?> search(
      String searchKeyword, String nextPageToken) async {
    String url =
        "/search?part=snippet&maxResults=10&order=date&type=video&videoDefinition=high&key=AIzaSyBTXPa0hTPLds9U1oCGBLaDs2jZ9_QLDWw&pageToken=$nextPageToken&q=$searchKeyword";
    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.status);
    } else {
      if (response.body["items"] != null && response.body["items"].length > 0) {
        return YoutubeVideoResult.fromJson(response.body);
      }
    }
  }

  Future<Statistics?> getVideoInfoById(String videoId) async {
    String url =
        "/videos?part=statistics&key=AIzaSyBTXPa0hTPLds9U1oCGBLaDs2jZ9_QLDWw&id=$videoId";
    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.status);
    } else {
      if (response.body["items"] != null && response.body["items"].length > 0) {
        Map<String, dynamic> data = response.body["items"][0];
        return Statistics.fromJson(data["statistics"]);
      }
    }
  }

  Future<Youtuber?> getYoutuberInfoById(String channelId) async {
    String url =
        "/channels?part=statistics,snippet&key=AIzaSyBTXPa0hTPLds9U1oCGBLaDs2jZ9_QLDWw&id=$channelId";
    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.status);
    } else {
      if (response.body["items"] != null && response.body["items"].length > 0) {
        Map<String, dynamic> data = response.body["items"][0];
        return Youtuber.fromJson(data);
      }
    }
  }
}
