import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/services/constants.dart';
import 'package:fruits_hub/core/services/shared_pref.dart';
import 'package:fruits_hub/core/styles/app_colors.dart';
import 'package:fruits_hub/core/widgets/custom_botton.dart';

import '../../../../core/routing/routes.dart';
import 'widgets/on_boarding_page_view.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

int currentPage = 0;

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController controller;
  @override
  void initState() {
    controller = PageController();
    controller.addListener(() {
      currentPage = controller.page!.round();
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Expanded(
              child: OnBoardingPageView(
            controller: controller,
          )),
          DotsIndicator(
            mainAxisSize: MainAxisSize.max,
            dotsCount: 2,
            position: currentPage,
            decorator: DotsDecorator(
                color: currentPage == 1
                    ? AppColors.primaryColor
                    : AppColors.primaryColor.withOpacity(0.5),
                activeColor: AppColors.primaryColor),
          ),
          const SizedBox(
            height: 29,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Visibility(
              maintainState: true,
              maintainAnimation: true,
              maintainSize: true,
              visible: currentPage == 1 ? true : false,
              child: CustomBotton(
                onPressed: () {
                  SharedPrefSingleton.setBool(isOnBoardingScreenSeen, true);
                  Navigator.pushReplacementNamed(context, Routes.login);
                },
                text: 'ابدأ الان',
              ),
            ),
          ),
          const SizedBox(
            height: 43,
          )
        ],
      ),
    ));
  }
}
