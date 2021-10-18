import 'package:FinDit/models/statistics.dart';
import 'package:FinDit/models/video.dart';
import 'package:FinDit/models/youtuber.dart';
import 'package:FinDit/repository/youtube_repository.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class VideoController extends GetxController {
  Video? video;
  VideoController({ this.video});
  Rx<Statistics> statistics = Statistics().obs;
  Rx<Youtuber> youtuber = Youtuber().obs;

  @override
  void onInit() async {
    Statistics? loadStatistics =
        await YoutubeRepository.to.getVideoInfoById(video!.id!.videoId!);
    statistics(loadStatistics);
    Youtuber? loadYoutuber = await YoutubeRepository.to
        .getYoutuberInfoById(video!.snippet!.channelId);
    youtuber(loadYoutuber);
    super.onInit();
  }

  String get viewCountString => "조회수 ${statistics.value.viewCount ?? '-'}회";
  
  String get youtuberThumbnailUrl {
    if (youtuber.value.snippet == null)
      return "https://cdn4.iconfinder.com/data/icons/small-n-flat/24/user-alt-512.png";
    return youtuber.value.snippet!.thumbnails.medium.url;
  }

  
}
