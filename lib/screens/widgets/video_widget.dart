import 'package:FinDit/constants/size_config.dart';
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
        tag: widget.video.id.videoId);
    super.initState();
  }

  Widget _thumbnail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: CachedNetworkImage(
              imageUrl: widget.video.snippet.thumbnails.medium.url,
              placeholder: (context, url) => Container(
                    height: 230,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
              fit: BoxFit.fitWidth),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        ),
        // Container(
        //   height: 210,
        //   color: Colors.grey.withOpacity(0.5),
        //   clipBehavior: Clip.antiAliasWithSaveLayer,
        //   child: Image.network(
        //     widget.video.snippet.thumbnails.medium.url,
        //     fit: BoxFit.fitWidth,
        //   ),
        //    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        // ),
      ],
    );
  }

  Widget _simpleDetailinfo() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey.withOpacity(0.5),
            backgroundImage:
                Image.network(_videoController!.youtuberThumbnailUrl).image,
          ),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              children: [
                Text(
                  widget.video.snippet.title,
                  maxLines: 2,
                  style: TextStyle(fontSize: 13),
                ),
                Row(
                  children: [
                    Text(
                      widget.video.snippet.channelTitle,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black.withOpacity(0.8),
                      ),
                    ),
                    // Obx(
                    //   () => Text(
                    //     _videoController!.viewCountString,
                    //     style: TextStyle(
                    //       fontSize: 12,
                    //       color: Colors.black.withOpacity(0.6),
                    //     ),
                    //   ),
                    // ),
                    Text(" · "),
                    Text(
                      DateFormat("yyyy-MM-dd")
                          .format(widget.video.snippet.publishTime),
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black.withOpacity(0.6),
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
