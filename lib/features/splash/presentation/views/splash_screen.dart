import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/utils/assets.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/services/constants.dart';
import '../../../../core/services/shared_pref.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigation(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: SvgPicture.asset(Assets.imagesPlant)),
            SvgPicture.asset(Assets.imagesSplashLogo),
            SvgPicture.asset(
              Assets.imagesSplashBottom,
              fit: BoxFit.fill,
            ),
          ],
        ),
      ),
    );
  }
}

void navigation(BuildContext context) {
  bool isOnBoardingScreenShown =
      SharedPrefSingleton.getBool(isOnBoardingScreenSeen);
  Future.delayed(const Duration(seconds: 3), () {
    if (isOnBoardingScreenShown) {
      Navigator.pushReplacementNamed(context, Routes.login);
    } else {
      Navigator.pushReplacementNamed(context, Routes.onBoarding);
    }
  });
}
