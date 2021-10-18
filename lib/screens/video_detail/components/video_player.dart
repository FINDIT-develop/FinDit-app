import 'package:FinDit/constants/constants.dart';
import 'package:FinDit/controllers/video_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayer extends StatelessWidget {
  YoutubePlayerController controller;
  VideoPlayer({Key? key, required this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: controller,
          bottomActions: [
            CurrentPosition(),
            const SizedBox(width: 10.0),
            ProgressBar(
              isExpanded: true,
              colors: ProgressBarColors(
                  playedColor: kActiveColor, handleColor: kActiveColor),
            ),
            const SizedBox(width: 10.0),
            RemainingDuration(),
            //FullScreenButton(),
          ],
        ),
        builder: (context, player) {
          return Column(
            children: [
              player,
            ],
          );
        });
  }
}
