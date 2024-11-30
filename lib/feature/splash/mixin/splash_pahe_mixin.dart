import 'package:auto_route/auto_route.dart';
import 'package:film_oasis/feature/splash/splash_page.dart';
import 'package:film_oasis/product/constants/enum/app_duration.dart';
import 'package:film_oasis/product/navigate/app_router.gr.dart';
import 'package:flutter/material.dart';

mixin SplashPaheMixin on State<SplashScreen> {
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: AppDuration.three.value),
      vsync: this as TickerProvider,
    );

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        context.replaceRoute(const TabbarRoute());
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
