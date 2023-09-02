import 'package:flight/core/device/constants.dart';
import 'package:flight/core/view/widgets/lottie/lottie_widget.dart';
import 'package:flight/splash/splash_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashView extends SplashViewModel {
  double imageOpacity = 0;
  bool showIndicator = false;
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      controlTokenn();
      setState(() {
        imageOpacity = 1;
      });

      Future.delayed(const Duration(seconds: 1));

      setState(() {
        showIndicator = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildSplashScreen(),
    );
  }

  Column buildSplashScreen() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildAnimatedOpacityLottie(),
        buildLoadingTextVisibility(),
        const SizedBox(
          height: 12,
        ),
        buildLoadingVisibility()
      ],
    );
  }

  Visibility buildLoadingTextVisibility() =>
      Visibility(visible: showIndicator, child: const Text("Loading..."));

  Visibility buildLoadingVisibility() {
    return Visibility(
        visible: showIndicator, child: const CircularProgressIndicator());
  }

  AnimatedOpacity buildAnimatedOpacityImage() {
    return AnimatedOpacity(
        opacity: imageOpacity,
        duration: const Duration(seconds: 1),
        child: Center(child: SvgPicture.asset(ImageConstants.FLY_SVG)));
  }

  Widget buildAnimatedOpacityLottie() {
    return AnimatedOpacity(
        opacity: imageOpacity,
        duration: const Duration(seconds: 1),
        child: const Center(
            child: LottieCustomWidget(
          path: ImageConstants.FLY_LOTTIE,
        )));
  }
}
