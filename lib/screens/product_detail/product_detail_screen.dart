import 'package:FinDit/constants/constants.dart';
import 'package:FinDit/controllers/home_controller.dart';
import 'package:FinDit/models/product.dart';
import 'package:FinDit/screens/store/components/item_card.dart';
import 'package:FinDit/screens/video_detail/video_detail_screen.dart';
import 'package:FinDit/screens/widgets/video_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/purchase_bar.dart';
import 'components/product_image.dart';
import 'components/product_intro.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;
  final HomeController controller = Get.put(HomeController());
  ProductDetailScreen({Key? key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(slivers: [
            SliverAppBar(
              title: Text("상세페이지",
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )),
              floating: true,
              snap: false,
              titleSpacing: 0,
              // backgroundColor: Colors.transparent,
            ),
            SliverToBoxAdapter(
              child: ProductImage(product: product),
            ),
            SliverToBoxAdapter(child: ProductIntro(product: product, key: key)),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Text("영상 후기",
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
            _videoreview(),
            SliverToBoxAdapter(
              child: Divider(
                thickness: 0.75,
                color: Colors.grey[200],
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 20, bottom: 10),
                child: Text("비슷한 제품",
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
            _recommendeditem(),
            SliverToBoxAdapter(
              child: Divider(
                thickness: 0.75,
                color: Colors.grey[200],
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 20, bottom: 10),
                child: Text("추천 영상",
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
            _recommendedvideo()
          ]),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Colors.white,
                child: PurchaseBar(product: product),
              ))
        ],
      ),
    );
  }

  Widget _videoreview() {
    return SliverToBoxAdapter(
      child: Container(
        height: 300.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.youtubeResult.value.items.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.to(() => VideoDetailScreen());
                // Get.toNamed("/detail/${controller.youtubeResult.value.items[index].id.videoId}");
              },
              child: Container(
                width: 350,
                child: VideoWidget(
                    video: controller.youtubeResult.value.items[index]),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _recommendeditem() {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 300.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: products.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: ItemCard(
                product: products[index],
                press: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailScreen(
                        product: products[index],
                      ),
                    )),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _recommendedvideo() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return GestureDetector(
            onTap: () {
              Get.to(() => VideoDetailScreen());
              // Get.toNamed("/detail/${controller.youtubeResult.value.items[index].id.videoId}");
            },
            child:
                VideoWidget(video: controller.youtubeResult.value.items[index]),
          );
        },
        childCount: controller.youtubeResult.value.items.length,
      ),
    );
  }
}
