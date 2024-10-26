import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/config/constants/api_links.dart';
import '../../../core/config/constants/assets.dart';
import '../../../core/config/constants/variables.dart';
import '../../../data/model/items_model.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    required this.itemModel,
    this.cardPressed,
    required this.favoritePressed,
  });
  final ItemsModel itemModel;
  final void Function()? cardPressed;
  final void Function() favoritePressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 1.5,
              spreadRadius: 0.00,
              offset: Offset(0, 0.8),
            )
          ]),
      child: SizedBox(
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text.rich(
                maxLines: 1,
                TextSpan(children: [
                  TextSpan(
                      text: '\$',
                      style: TextStyle(
                          color: Colors.blue[400],
                          fontSize: 15,
                          fontWeight: FontWeight.w500)),
                  TextSpan(
                      text: itemModel.price.toString(),
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500)),
                ])),
            IconButton(
              onPressed: favoritePressed,
              icon: const Icon(Icons.favorite),
              color: favoriteItemId.contains(int.parse(itemModel.id!))
                  ? Colors.redAccent
                  : Colors.grey,
            )
          ]),
          InkWell(
            onTap: cardPressed,
            child: Column(
              children: [
                Badge(
                  smallSize: size * 0.055,
                  largeSize: size * 0.05,
                  backgroundColor: const Color.fromARGB(255, 240, 127, 5),
                  isLabelVisible: (itemModel.discount! > 0) ? true : false,
                  label: Text.rich(TextSpan(children: [
                    TextSpan(text: itemModel.discount.toString()),
                    const TextSpan(text: '%')
                  ])),
                  child: SizedBox(
                    height: Get.height * 0.13,
                    child: Hero(
                      tag: itemModel.image!,
                      child: FadeInImage.assetNetwork(
                          placeholder: ImagesAsset.grey,
                          image: '$itemsImageRoot/${itemModel.image!}'),
                    ),
                  ),
                ),
                Divider(height: Get.height * 0.009, color: Colors.transparent),
                Text(
                    (localeValue == 'en'
                            ? itemModel.name
                            : localeValue == 'ar'
                                ? itemModel.nameAr
                                : itemModel.nameFr) ??
                        '',
                    maxLines: 1,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w500))
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
