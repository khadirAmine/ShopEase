import 'package:get/get.dart';

class ItemDetailsController extends GetxController {
  late int itemId;
  late String itemName;
  late String itemNameAr;
  late String itemNameFr;
  late String itemDesc;
  late String itemDescAr;
  late String itemDescFr;
  late String itemPrice;
  late String itemDiscount;
  late String itemCount;
  late String imageName;
  late Map<String, dynamic> itemData;
  late int itemIndex;
  late bool fromHome;
  RxBool buyLoading = RxBool(false);
  int orderCount = 1;

  @override
  void onInit() async {
    itemData = Get.arguments['itemData'];
    itemId = itemData['item_id'];
    itemName = itemData['item_name'];
    itemNameAr = itemData['item_name_ar'];
    itemNameFr = itemData['item_name_fr'];
    itemDesc = itemData['item_desc'];
    itemDescAr = itemData['item_desc_ar'];
    itemDescFr = itemData['item_desc_fr'];
    itemPrice = itemData['item_price'].toString();
    itemDiscount = itemData['item_discount'].toString();
    itemCount = itemData['item_count'].toString();
    imageName = itemData['item_image'];
    itemIndex = Get.arguments['itemIndex'];
    fromHome = Get.arguments['fromHome'];

    super.onInit();
  }

  @override
  void onClose() async {
    orderCount = 1;

    super.onClose();
  }
}
