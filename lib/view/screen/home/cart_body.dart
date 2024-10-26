import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home/home_controller.dart';
import '../../../core/config/constants/routes.dart';
import '../../../core/config/constants/variables.dart';
import '../../../core/functions/add_order.dart';
import '../../../data/model/order_model.dart';
import '../../../data/remote/api_remote.dart';
import '../../widgets/home/order_card.dart';
import '../../widgets/packages/custom_button.dart';
import '../../widgets/packages/loading.dart';

class OrderBody extends StatelessWidget {
  const OrderBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: GetBuilder<HomeController>(
            init: HomeController(),
            builder: (controller) => orderData.isNotEmpty
                ? CustomButton(
                    color: Colors.blueAccent[400],
                    margin: EdgeInsets.only(bottom: Get.height * 0.018),
                    withe: Get.width * 0.7,
                    height: Get.height * 0.06,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Buying'.tr,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600)),
                        const VerticalDivider(color: Colors.transparent),
                        Icon(Icons.shopping_cart,
                            color: Colors.white, size: size * 0.06)
                      ],
                    ),
                  )
                : const Card(color: Colors.transparent)),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Center(
          child: GetBuilder<HomeController>(
              init: HomeController(),
              builder: (controller) => RefreshIndicator(
                    onRefresh: () async {
                      await controller.getOrderData();
                    },
                    color: Colors.blueAccent,
                    child: Loading(
                      isLoading: controller.orderBodyLoading,
                      size: size * 0.055,
                      color: Colors.blueAccent,
                      child: orderData.isNotEmpty
                          ? Column(children: [
                              Row(children: [
                                VerticalDivider(width: Get.width * 0.15),
                                Text('My Cart'.tr,
                                    style: const TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.w600)),
                              ]),
                              const Divider(color: Colors.transparent),
                              Expanded(
                                child: Scrollbar(
                                  interactive: true,
                                  radius: const Radius.circular(10),
                                  thickness: 7,
                                  child: ListView.builder(
                                      itemCount: orderData.length,
                                      itemBuilder: (context, i) {
                                        return OrderCard(
                                            onTap: () {
                                              Get.toNamed(Routes.itemDetails,
                                                  arguments: {
                                                    'itemData': orderData[i],
                                                    'itemIndex': i,
                                                    'fromHome': false
                                                  });
                                            },
                                            onDeleteTap: () async {
                                              Get.defaultDialog(
                                                  title: 'Alert !'.tr,
                                                  content: Text(
                                                      'Are You Sure to delete this order?'
                                                          .tr,
                                                      style: const TextStyle(
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.w500)),
                                                  cancel: CustomButton(
                                                      onTap: () async {
                                                        controller.deleteLoading
                                                            .value = true;
                                                        int itemId =
                                                            orderData[i]
                                                                ['item_id'];
                                                        orderData.removeAt(i);
                                                        controller.update();
                                                        await ApiRemote
                                                            .deleteAllOrders(
                                                                userData[0]
                                                                    ['user_id'],
                                                                itemId);
                                                        controller.deleteLoading
                                                            .value = false;
                                                        Get.back();
                                                      },
                                                      color: Colors.orange,
                                                      child: Loading(
                                                          isLoading: controller
                                                              .deleteLoading,
                                                          color: Colors.white,
                                                          size: 24,
                                                          child: Text('Delete'.tr,
                                                              style: const TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight: FontWeight
                                                                      .w500)))),
                                                  confirm: CustomButton(
                                                      onTap: () {
                                                        Get.back();
                                                      },
                                                      child: Text('Cancel'.tr,
                                                          style: const TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500))));
                                            },
                                            onAddPressed: () async {
                                              if (orderData[i]['order_count'] <
                                                  orderData[i]['item_count']) {
                                                orderData[i]['order_count']++;
                                                controller.update();
                                                await addOrder(
                                                    orderData[i]['item_id']);
                                              }
                                            },
                                            onRemovePressed: () async {
                                              if (orderData[i]['order_count'] >
                                                  1) {
                                                orderData[i]['order_count']--;
                                                controller.update();
                                                await ApiRemote.deleteOrder(
                                                    orderData[i]['order_id']);
                                              }
                                            },
                                            orderModel: OrderModel.fromJson(
                                                orderData[i]));
                                      }),
                                ),
                              )
                            ])
                          : Center(child: Text('No results'.tr)),
                    ),
                  )),
        ));
  }
}
