import 'package:FinDit/models/Product.dart';
import 'package:FinDit/views/constants/constants.dart';
import 'package:FinDit/controllers/home_controller.dart';
import 'package:FinDit/controllers/product_controller.dart';
import 'package:FinDit/views/widgets/video_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/purchase_bar.dart';
import 'components/product_image.dart';
import 'components/product_intro.dart';

class ProductDetailScreen extends GetView<ProductController> {
  final HomeController homecontroller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    controller.loadProductById(Get.arguments.productId.toString());
    return Scaffold(
        body: controller.isLoading.value
            ? Stack(
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
                      child: ProductImage(product: controller.product),
                    ),
                    SliverToBoxAdapter(
                        child: ProductIntro(
                            product: controller.product, key: key)),

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
                    // SliverToBoxAdapter(
                    //   child: Padding(
                    //     padding: const EdgeInsets.only(
                    //         left: 20, right: 20, top: 20, bottom: 10),
                    //     child: Text("비슷한 제품",
                    //         style: TextStyle(
                    //           color: kPrimaryColor,
                    //           fontSize: 18,
                    //           fontWeight: FontWeight.bold,
                    //         )),
                    //   ),
                    // ),
                    // _recommendeditem(),
                    // SliverToBoxAdapter(
                    //   child: Divider(
                    //     thickness: 0.75,
                    //     color: Colors.grey[200],
                    //   ),
                    // ),
                    // SliverToBoxAdapter(
                    //   child: Padding(
                    //     padding: const EdgeInsets.only(
                    //         left: 20, right: 20, top: 20, bottom: 10),
                    //     child: Text("추천 영상",
                    //         style: TextStyle(
                    //           color: kPrimaryColor,
                    //           fontSize: 18,
                    //           fontWeight: FontWeight.bold,
                    //         )),
                    //   ),
                    // ),
                    // _recommendedvideo()
                  ]),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        color: Colors.white,
                        child: PurchaseBar(product: controller.product),
                      ))
                ],
              )
            : Center(
                child: CircularProgressIndicator(),
              ));
  }

  Widget _videoreview() {
    return SliverToBoxAdapter(
      child: Container(
        height: 400.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: homecontroller.youtubeResult.value.items.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.toNamed(
                    "/detail/${homecontroller.youtubeResult.value.items[index].id!.videoId}");
              },
              child: Container(
                width: 350,
                child: VideoWidget(
                    video: homecontroller.youtubeResult.value.items[index]),
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
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(padding: const EdgeInsets.all(10.0), child: null);
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
}
