import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home/home_controller.dart';
import '../../../core/config/constants/api_links.dart';
import '../../../core/config/constants/assets.dart';
import '../../../core/config/constants/variables.dart';
import '../../../data/model/order_model.dart';
import '../packages/custom_button.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    super.key,
    required this.orderModel,
    this.onTap,
    this.onDeleteTap,
    this.onAddPressed,
    this.onRemovePressed,
  });

  final OrderModel orderModel;
  final void Function()? onTap;
  final void Function()? onDeleteTap;
  final void Function()? onAddPressed;
  final void Function()? onRemovePressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          width: Get.width * 0.4,
          height: Get.height * 0.15,
          margin: EdgeInsets.symmetric(
              horizontal: Get.width * 0.045, vertical: Get.height * 0.011),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(137, 162, 160, 160),
                  blurRadius: 5,
                  spreadRadius: 1,
                  offset: Offset(0, 2),
                )
              ]),
          child: Padding(
              padding: const EdgeInsets.all(7),
              child: Row(
                children: [
                  SizedBox(
                      width: Get.width * 0.38,
                      height: Get.height,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Divider(
                                height: Get.height * 0.002,
                                color: Colors.transparent),
                            Text(
                                localeValue == 'en'
                                    ? orderModel.name!
                                    : localeValue == 'ar'
                                        ? orderModel.nameAr!
                                        : orderModel.nameFr!,
                                maxLines: 1,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500)),
                            Divider(
                                height: Get.height * 0.007,
                                color: Colors.transparent),
                            Text.rich(
                                style: const TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w500),
                                TextSpan(children: [
                                  const TextSpan(
                                      text: '\$',
                                      style: TextStyle(color: Colors.red)),
                                  TextSpan(text: orderModel.price.toString())
                                ])),
                            Row(
                              children: [
                                IconButton(
                                    onPressed: onAddPressed,
                                    icon: const Icon(Icons.add),
                                    color: Colors.black54),
                                GetBuilder<HomeController>(
                                    init: HomeController(),
                                    builder: (controller) => Text(
                                          orderModel.orderCount.toString(),
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500),
                                        )),
                                IconButton(
                                    onPressed: onRemovePressed,
                                    icon: const Icon(Icons.remove),
                                    color: Colors.black54)
                              ],
                            )
                          ])),
                  const Spacer(),
                  SizedBox(
                      width: Get.width * 0.3,
                      height: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: FadeInImage.assetNetwork(
                            placeholder: ImagesAsset.grey,
                            image: '$itemsImageRoot/${orderModel.image!}'),
                      )),
                  CustomButton(
                      onTap: onDeleteTap,
                      withe: Get.width * 0.11,
                      height: Get.height * 0.07,
                      margin: EdgeInsets.only(left: Get.width * 0.03),
                      color: Colors.blue[300],
                      child: Icon(Icons.delete, size: size * 0.06))
                ],
              ))),
    );
  }
}
