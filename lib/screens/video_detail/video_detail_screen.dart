import 'dart:io';

import 'package:FinDit/constants/constants.dart';
import 'package:FinDit/controllers/home_controller.dart';
import 'package:FinDit/controllers/product_controller.dart';
import 'package:FinDit/controllers/video_detail_controller.dart';
import 'package:FinDit/screens/product_detail/product_detail_screen.dart';
import 'package:FinDit/screens/store/components/item_card.dart';
import 'package:FinDit/screens/widgets/dialog_helper.dart';
import 'package:FinDit/screens/widgets/primary_button.dart';
import 'package:FinDit/screens/widgets/webview.dart';
import 'package:FinDit/screens/widgets/video_widget.dart';
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
                    child: SvgPicture.asset("assets/icons/like_active.svg")),
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
            return ItemCard(
              product: productController.productList.value[index],
              press: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailScreen(
                      product: productController.productList.value[index],
                    ),
                  )),
            );
          },
          childCount: productController.productList.value.length,
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
              actions: [
                IconButton(
                    onPressed: () => Get.to(() => WebViewExample()),
                    icon: Icon(Icons.link))
              ],
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
            //_inthisvideo(),
            SliverToBoxAdapter(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(kDefaultPadding),
                  child: PrimaryButton(
                    text: "AI로 의류 찾기",
                    onTap: () async {
                      var path = await NativeScreenshot.takeScreenshot();

                      debugPrint('Screenshot taken, path: $path');

                      if (path == null || path.isEmpty) {
                        DialogHelper.showErrSnackbar(
                            description: 'Error taking the screenshot :(');
                        return;
                      } // if error
                      DialogHelper.showErrSnackbar(
                          title: '캡쳐 완료',
                          description:
                              'The screenshot has been saved to: $path');

                      var imgFile = File(path);
                      _imgHolder = Image.file(imgFile);
                    },
                  ),
                ),
              ),
            ),
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
