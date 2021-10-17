import 'package:FinDit/constants/constants.dart';
import 'package:FinDit/controllers/home_controller.dart';
import 'package:FinDit/controllers/video_detail_controller.dart';
import 'package:FinDit/models/product.dart';
import 'package:FinDit/models/video.dart';
import 'package:FinDit/screens/product_detail/product_detail_screen.dart';
import 'package:FinDit/screens/store/components/item_card.dart';
import 'package:FinDit/screens/widgets/video_player.dart';
import 'package:FinDit/screens/widgets/video_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class VideoDetailScreen extends GetView<YoutubeDetailController> {
  VideoDetailScreen({Key? key}) : super(key: key);

  Widget _titleZone() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: Colors.grey[400],
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "eng. 2년 만에 찾아온 나 혼자만의 시간... 나홀로 즐기는 장미빛 하루 VLOG",
                    style: TextStyle(height: 1.2),
                    maxLines: 2,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: InkWell(
                  onTap: () {},
                  child: SvgPicture.asset("assets/icons/like_active.svg")),
            )
          ],
        ),
      ),
    );
  }

  Widget _inthisvideo() {
    return SliverPadding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return ItemCard(
              product: products[index],
              press: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailScreen(
                      product: products[index],
                    ),
                  )),
            );
          },
          childCount: products.length,
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
    return SliverPadding(
      padding: const EdgeInsets.only(bottom: 30),
      sliver: SliverFixedExtentList(
        itemExtent: 210.0,
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              alignment: Alignment.center,
              color: Colors.grey[200],
              height: 210,
            ),
          );
        }, childCount: 5),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
              title: VideoPlayer(),
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
            _inthisvideo(),
            SliverToBoxAdapter(
              child: Divider(
                thickness: 0.75,
                color: Colors.grey[200],
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Text("추천 영상",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
            _recommendvideo()
          ],
        ),
      ),
    );
  }
}
