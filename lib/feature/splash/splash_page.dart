import 'package:auto_route/auto_route.dart';
import 'package:film_oasis/feature/splash/mixin/splash_pahe_mixin.dart';
import 'package:film_oasis/product/constants/enum/json_path.dart';
import 'package:film_oasis/product/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin, SplashPaheMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Lottie.asset(
          height: context.dynamicHeight(0.19),
          width: context.dynamicHeight(0.19),
          JsonPath.movieLottie.value,
          controller: controller,
          onLoaded: (composition) {
            controller
              ..duration = composition.duration
              ..forward();
          },
        ),
      ),
    );
  }
}
