// import 'package:FinDit/models/Video.dart';
// import 'package:FinDit/repository/youtube_repository.dart';
// import 'package:get/get.dart';


// class VideoController extends GetxService{
//  Video video;
//   VideoController({required this.video});
//   Rx<Statistics> statistics = Statistics().obs;
//   Rx<Youtuber> youtuber = Youtuber().obs;
//   @override
//   void onInit() async {
//     Statistics loadStatistics =
//         await YoutubeRepository.to.getVideoInfoById(video.id.videoId);
//     statistics(loadStatistics);
//     Youtuber loadYoutuber =
//         await YoutubeRepository.to.getYoutuberInfoById(video.snippet.channelId);
//     youtuber(loadYoutuber);
//     super.onInit();
//   }

//   String get viewCountString => "조회수 ${statistics.value.viewCount ?? '-'}회";
//   String get youtuberThumbnailUrl {
//     if (youtuber.value.snippet == null)
//       return "https://cdn4.iconfinder.com/data/icons/small-n-flat/24/user-alt-512.png";
//     return youtuber.value.snippet.thumbnails.medium.url;
//   }
// }