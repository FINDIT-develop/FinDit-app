import 'package:FinDit/models/statistics.dart';
import 'package:FinDit/models/video.dart';
import 'package:FinDit/models/youtuber.dart';
import 'package:FinDit/repository/youtube_service.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class VideoController extends GetxController {
  Video? video;
  VideoController({this.video});
  Rx<Statistics> statistics = Statistics().obs;
  Rx<Youtuber> youtuber = Youtuber().obs;

  @override
  void onInit() async {
    var loadStatistics =
        await YoutubeService.to.getVideoInfoById(video!.id!.videoId!);
    statistics(loadStatistics);
    var loadYoutuber =
        await YoutubeService.to.getYoutuberInfoById(video!.snippet!.channelId!);
    youtuber(loadYoutuber);
    super.onInit();
  }

  String get viewCountString => "조회수 ${statistics.value.viewCount ?? '-'}회";

  String get youtuberThumbnailUrl {
    if (youtuber.value.snippet == null) {
      return "https://icon-library.com/images/no-profile-pic-icon/no-profile-pic-icon-11.jpg";
    }
    return youtuber.value.snippet!.thumbnails!.high.url;
  }
}
