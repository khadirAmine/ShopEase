import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/api_links.dart';
import '../../../core/constants/assets.dart';
import '../../../core/constants/variables.dart';

class ItemImageDetails extends StatelessWidget {
  const ItemImageDetails(
      {super.key,
      required this.imageName,
      this.onPressedFavorite,
      required this.itemId,
      required this.itemDiscount});
  final String imageName;
  final void Function()? onPressedFavorite;
  final int itemId;
  final double itemDiscount;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.2),
        child: Badge(
            smallSize: size * 0.055,
            largeSize: size * 0.05,
            backgroundColor: const Color.fromARGB(255, 240, 127, 5),
            isLabelVisible: (itemDiscount > 0) ? true : false,
            label: Text.rich(TextSpan(children: [
              TextSpan(text: itemDiscount.toString()),
              const TextSpan(text: '%')
            ])),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Hero(
                    tag: imageName,
                    child: FadeInImage.assetNetwork(
                        placeholder: ImagesAsset.grey,
                        image: '$itemsImageRoot/$imageName'),
                  ),
                ),
                Positioned(
                  child: IconButton(
                      onPressed: onPressedFavorite,
                      icon: Icon(Icons.favorite,
                          color: favoriteItemId.contains(itemId)
                              ? Colors.redAccent
                              : Colors.grey),
                      iconSize: size * 0.05),
                ),
              ],
            )));
  }
}
