import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/routing/routes.dart';
import 'package:fruits_hub/core/services/firebase_auth_services.dart';
import 'package:fruits_hub/features/auth/data/repos/auth_repo_impl.dart';
import 'package:fruits_hub/features/auth/presentation/views/cubits/login_cubit/login_cubit.dart';
import 'package:fruits_hub/features/auth/presentation/views/cubits/sign_up_cubit/signup_cubit.dart';
import 'package:fruits_hub/features/auth/presentation/views/login_screen.dart';
import 'package:fruits_hub/features/auth/presentation/views/sign_up_screen.dart';
import 'package:fruits_hub/features/on_boarding/presentation/views/on_boarding_screen.dart';

import '../../features/splash/presentation/views/splash_screen.dart';

class AppRouter {
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case Routes.onBoarding:
        return MaterialPageRoute(
            builder: (context) => const OnBoardingScreen());
      case Routes.login:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => LoginCubit(
                      AuthRepoImpl(firebaseServices: FirebaseAuthServices())),
                  child: const LoginScreen(),
                ));
      case Routes.signUp:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => SignUpCubit(
                      AuthRepoImpl(firebaseServices: FirebaseAuthServices())),
                  child: const SignUpScreen(),
                ));

      default:
        return MaterialPageRoute(builder: (context) => const NoRouteScreen());
    }
  }
}

class NoRouteScreen extends StatelessWidget {
  const NoRouteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('No route defined'),
      ),
    );
  }
}
