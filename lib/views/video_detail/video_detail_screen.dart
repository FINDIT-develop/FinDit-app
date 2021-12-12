import 'dart:io';

import 'package:FinDit/views/constants/constants.dart';
import 'package:FinDit/controllers/home_controller.dart';
import 'package:FinDit/controllers/product_controller.dart';
import 'package:FinDit/controllers/video_detail_controller.dart';
import 'package:FinDit/views/find/find_screen.dart';
import 'package:FinDit/views/product_detail/product_detail_screen.dart';
import 'package:FinDit/views/store/components/item_card.dart';
import 'package:FinDit/views/widgets/dialog_helper.dart';
import 'package:FinDit/views/widgets/primary_button.dart';
import 'package:FinDit/views/widgets/secondary_button.dart';
import 'package:FinDit/views/widgets/webview.dart';
import 'package:FinDit/views/widgets/video_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:native_screenshot/native_screenshot.dart';
import '../widgets/video_player.dart';
import 'package:screenshot/screenshot.dart';

class VideoDetailScreen extends GetView<YoutubeDetailController> {
  VideoDetailScreen({Key? key}) : super(key: key);
  final HomeController homecontroller = Get.put(HomeController());
  final ProductController productController = Get.put(ProductController());
  var globalKey = GlobalKey();
  final ScreenshotController screenshotController = ScreenshotController();

  Widget _titleZone() {
    return SliverToBoxAdapter(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  controller.video.value.snippet!.title!,
                  style: TextStyle(height: 1.2),
                  maxLines: 2,
                ),
              ),
            ],
          ),
          // Text(
          //   controller.video.value.snippet!.description!,
          //   style: TextStyle(color: Colors.grey),
          // ),
          SizedBox(
            height: 10,
          ),
          Text(
            DateFormat("yyyy.MM.dd")
                .format(controller.video.value.snippet!.publishTime!),
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              CircleAvatar(
                radius: 15,
                backgroundColor: Colors.grey.withOpacity(0.5),
                backgroundImage: Image.network(
                        controller.videoController!.youtuberThumbnailUrl)
                    .image,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Text(controller.video.value.snippet!.channelTitle!)),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 5),
                child: InkWell(
                    onTap: () {},
                    child: SvgPicture.asset(
                      "assets/icons/like_active.svg",
                      height: 20,
                    )),
              ),
            ],
          ),
        ],
      ),
    ));
  }

  Widget _inthisvideo() {
    return SliverPadding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return null;
          },
          childCount: 5,
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          //mainAxisSpacing: kDefaultPadding,
          crossAxisSpacing: kDefaultPadding,
          childAspectRatio: 0.6,
        ),
      ),
    );
  }

  Widget _recommendvideo() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return GestureDetector(
            onTap: () {
              Get.toNamed(
                  "/detail/${homecontroller.youtubeResult.value.items[index].id!.videoId}");
            },
            child: VideoWidget(
                video: homecontroller.youtubeResult.value.items[index]),
          );
        },
        childCount: homecontroller.youtubeResult.value.items.length,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget _imgHolder;
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text("영상",
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )),
              actions: [IconButton(onPressed: () {}, icon: Icon(Icons.link))],
              floating: true,
              snap: false,
              toolbarHeight: 50,
              titleSpacing: 0,
            ),
            SliverAppBar(
              automaticallyImplyLeading: false,
              title: Screenshot(
                  controller: screenshotController,
                  child: VideoPlayer(controller: controller.playController)),
              floating: false,
              snap: false,
              pinned: true,
              toolbarHeight: 210,
              titleSpacing: 0,
            ),
            _titleZone(),
            SliverToBoxAdapter(
              child: Divider(
                thickness: 0.75,
                color: Colors.grey[200],
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 20, bottom: 20),
                child: Text("영상 속 정보",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
            SliverToBoxAdapter(
                child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  "영상 속 옷이 궁금하다면 \n직접 찾아보세요!",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: kTextColor),
                ),
                SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {
                    Get.dialog(AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 0,
                      backgroundColor: Colors.white,
                      title: Column(
                        children: [
                          Text(
                            "00:00에서 나온 옷이 궁금하신가요?",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(height: 30),
                          CachedNetworkImage(
                              imageUrl:
                                  "https://i.ytimg.com/vi/Rq6MLuEa33k/hqdefault.jpg"),
                        ],
                      ),
                      actionsAlignment: MainAxisAlignment.center,
                      actions: [
                        Container(
                          width: 130,
                          child: TextButton(
                              onPressed: () => Get.back(),
                              child: Text(
                                "다음에 찾을게요.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: kTextColor,
                                    fontWeight: FontWeight.w600),
                              )),
                        ),
                        Container(
                          width: 130,
                          child: TextButton(
                            child: Text(
                              "찾아볼래요!",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            onPressed: () {
                              Get.back();
                              Get.to(() => FindScreen());
                            },
                          ),
                        )
                      ],
                    ));
                  },
                  child: CircleAvatar(
                    backgroundColor: kActiveColor,
                    foregroundColor: Colors.white,
                    radius: 25,
                    child: Icon(Icons.search),
                  ),
                )
              ],
            )),

            //_inthisvideo(),
            // SliverToBoxAdapter(
            //   child: Align(
            //     alignment: Alignment.bottomCenter,
            //     child: Padding(
            //       padding: const EdgeInsets.all(kDefaultPadding),
            //       child: PrimaryButton(
            //         text: "AI로 의류 찾기",
            //         onTap: () async {
            //           var path = await NativeScreenshot.takeScreenshot();

            //           debugPrint('Screenshot taken, path: $path');

            //           if (path == null || path.isEmpty) {
            //             DialogHelper.showErrSnackbar(
            //                 description: 'Error taking the screenshot :(');
            //             return;
            //           } // if error
            //           DialogHelper.showErrSnackbar(
            //               title: '캡쳐 완료',
            //               description:
            //                   'The screenshot has been saved to: $path');

            //           var imgFile = File(path);
            //           _imgHolder = Image.file(imgFile);
            //         },
            //       ),
            //     ),
            //   ),
            // ),
            // SliverToBoxAdapter(
            //   child: Divider(
            //     thickness: 0.75,
            //     color: Colors.grey[200],
            //   ),
            // ),
            // SliverToBoxAdapter(
            //   child: Padding(
            //     padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            //     child: Text("추천 영상",
            //         style: TextStyle(
            //           fontSize: 18,
            //           fontWeight: FontWeight.bold,
            //         )),
            //   ),
            // ),
            //_recommendvideo()
          ],
        ),
      ),
    );
  }
}
