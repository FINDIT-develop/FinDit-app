import 'package:FinDit/controllers/video_cotroller.dart';
import 'package:FinDit/models/statistics.dart';
import 'package:FinDit/models/video.dart';
import 'package:FinDit/models/youtuber.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeDetailController extends GetxController {
  Rx<Video> video = Video().obs;
  Rx<Statistics> statistics = Statistics().obs;
  Rx<Youtuber> youtuber = Youtuber().obs;
  late YoutubePlayerController playController;
  VideoController? videoController;
  @override
  void onInit() {
    videoController =
        Get.put(VideoController(), tag: Get.parameters["videoId"]);
    video(videoController!.video);
    statistics(videoController!.statistics.value);
    youtuber(videoController!.youtuber.value);
    _event();
    super.onInit();
  }

  void _event() {
    playController = YoutubePlayerController(
      initialVideoId: video.value.id!.videoId!,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        enableCaption: true,
      ),
    );
  }
}
