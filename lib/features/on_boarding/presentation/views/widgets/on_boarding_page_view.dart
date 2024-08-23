import 'package:flutter/material.dart';
import 'package:fruits_hub/core/styles/styles.dart';

import '../../../../../core/styles/app_colors.dart';
import '../../../../../core/utils/assets.dart';
import 'page_view_item.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({
    super.key,
    this.controller,
  });
  final PageController? controller;

  @override
  Widget build(BuildContext context) {
    return PageView(controller: controller, children: [
      PageViewItem(
          isAvailable: true,
          image: Assets.imagesOnboarding1fg,
          bgImage: Assets.imagesOnboarding1bg,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('مرحبًا بك في', style: AppTextStyles.font23Bold),
              Text(' HUB',
                  style: AppTextStyles.font23Bold
                      .copyWith(color: const Color(0XFFF4A91F))),
              Text('Fruit',
                  style: AppTextStyles.font23Bold
                      .copyWith(color: AppColors.primaryColor)),
            ],
          ),
          subtitle:
              'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.'),
      PageViewItem(
          isAvailable: false,
          image: Assets.imagesOnBoarding2fg,
          bgImage: Assets.imagesOnBoarding2bg,
          title: Text('ابحث وتسوق', style: AppTextStyles.font23Bold),
          subtitle:
              'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية')
    ]);
  }
}
