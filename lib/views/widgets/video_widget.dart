import 'package:FinDit/views/constants/constants.dart';
import 'package:FinDit/views/constants/size_config.dart';
import 'package:FinDit/controllers/video_cotroller.dart';
import 'package:FinDit/models/video.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class VideoWidget extends StatefulWidget {
  final Video video;
  const VideoWidget({Key? key, required this.video}) : super(key: key);

  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  VideoController? _videoController;
  @override
  void initState() {
    _videoController = Get.put(VideoController(video: widget.video),
        tag: widget.video.id!.videoId);
    super.initState();
  }

  Widget _thumbnail() {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Container(
        height: 190,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: CachedNetworkImage(
            imageUrl: widget.video.snippet!.thumbnails!.high.url,
            placeholder: (context, url) => Container(
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Colors.grey,
                    ),
                  ),
                ),
            fit: BoxFit.fitWidth),
      ),
    ]);
  }

  Widget _simpleDetailinfo() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Obx(
            () => CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey.withOpacity(0.5),
              backgroundImage:
                  Image.network(_videoController!.youtuberThumbnailUrl).image,
            ),
          ),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              children: [
                Text(
                  widget.video.snippet!.title!,
                  maxLines: 2,
                  style: TextStyle(fontSize: 13),
                ),
                Row(
                  children: [
                    Text(
                      widget.video.snippet!.channelTitle!,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      " · ",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      DateFormat("yyyy-MM-dd")
                          .format(widget.video.snippet!.publishTime!),
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10, top: 10),
      child: Column(
        children: [
          _thumbnail(),
          _simpleDetailinfo(),
        ],
      ),
    );
  }
}
