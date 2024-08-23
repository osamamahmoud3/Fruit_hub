import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/styles/styles.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/services/constants.dart';
import '../../../../../core/services/shared_pref.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem(
      {super.key,
      required this.image,
      required this.bgImage,
      required this.title,
      required this.subtitle,
      required this.isAvailable});
  final String image, bgImage, subtitle;
  final Widget title;
  final bool isAvailable;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Stack(children: [
            Positioned.fill(
              child: SvgPicture.asset(
                bgImage,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SvgPicture.asset(
                image,
              ),
            ),
            Visibility(
              visible: isAvailable,
              child: GestureDetector(
                onTap: () {
                  SharedPrefSingleton.setBool(isOnBoardingScreenSeen, true);
                  Navigator.pushReplacementNamed(context, Routes.login);
                },
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'تخط',
                    style: AppTextStyles.font13Regular
                        .copyWith(color: const Color(0XFF949D9E)),
                  ),
                ),
              ),
            )
          ]),
        ),
        const SizedBox(
          height: 64,
        ),
        title,
        const SizedBox(
          height: 24,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: AppTextStyles.font13SemiBold,
          ),
        ),
      ],
    );
  }
}
