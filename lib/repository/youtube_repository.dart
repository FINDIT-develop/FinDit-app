import 'package:FinDit/models/youtube_video_result.dart';
import 'package:get/get.dart';

class YoutubeRepository extends GetConnect {
  static YoutubeRepository get to => Get.find();

  @override
  void onInit() {
    httpClient.baseUrl = "https://www.googleapis.com/youtube/v3";
    super.onInit();
  }

  Future<YoutubeVideoResult?> loadVideos() async {
    String url =
        "/search?part=snippet&q=브이로그&maxResults=10&order=date&type=video&videoDefinition=high&key=AIzaSyBTXPa0hTPLds9U1oCGBLaDs2jZ9_QLDWw";
    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.status);
    } else {
      if (response.body["items"] != null && response.body["items"].length > 0) {
        return YoutubeVideoResult.fromJson(response.body);
      }
    }
  }
}
