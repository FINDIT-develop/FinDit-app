import 'package:FinDit/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayer extends StatelessWidget {
  YoutubePlayerController controller;
  VideoPlayer({Key? key, required this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool fullScreen = false;
    return YoutubePlayerBuilder(
        onEnterFullScreen: () {
          fullScreen = true;
        },
        onExitFullScreen: () {
          fullScreen = false;
        },
        player: YoutubePlayer(
          controller: controller,
          bottomActions: [
            const SizedBox(width: 10.0),
            CurrentPosition(),
            const SizedBox(width: 10.0),
            ProgressBar(
              isExpanded: true,
              colors: ProgressBarColors(
                  backgroundColor: Colors.white,
                  bufferedColor: Colors.grey,
                  playedColor: kActiveColor,
                  handleColor: kActiveColor),
            ),
            const SizedBox(width: 10.0),
            RemainingDuration(),
            FullScreenButton(),
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
