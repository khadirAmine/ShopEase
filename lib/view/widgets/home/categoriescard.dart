import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/variables.dart';
import '../../../data/model/categories_moderl.dart';

class CategoriesCard extends StatelessWidget {
  const CategoriesCard(
      {super.key, required this.categoriesModel, this.onTap, this.color});
  final CategoriesModel categoriesModel;
  final void Function()? onTap;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 7.5),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black, width: Get.width * 0.001)),
        child: Center(
          child: Text(
              maxLines: 1,
              (localeValue == 'en'
                      ? categoriesModel.name
                      : localeValue == 'ar'
                          ? categoriesModel.nameAr
                          : categoriesModel.nameFr) ??
                  '',
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
        ),
      ),
    );
  }
}
