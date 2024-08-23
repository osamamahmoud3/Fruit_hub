import 'package:flutter/material.dart';

import '../../../../../core/styles/styles.dart';

AppBar buildAppBar(String title, BuildContext context) {
  return AppBar(
    centerTitle: true,
    leadingWidth: 75,
    leading: GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        decoration: const ShapeDecoration(
          color: Colors.white,
          shape: OvalBorder(
            side: BorderSide(width: 1, color: Color(0xFFF1F1F5)),
          ),
        ),
        child: const Center(
          child: Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
      ),
    ),
    title:  Text(
     title,
      textAlign: TextAlign.center,
      style: AppTextStyles.font19BoldCairo,
    ),
  );
}
