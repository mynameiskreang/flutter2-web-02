import 'package:flutter/animation.dart';
import 'package:get/get.dart';

// ใช้สำหรับจัดการ state

class QuestionController extends GetxController
    with SingleGetTickerProviderMixin {
  // animation progress bar

  // Refer late from
  // https://flutter.dev/docs/development/ui/animations/tutorial#animationcontroller#rendering-animations
  late AnimationController _animationController;
  late Animation _animation;

  // บรรทัด 12 ทำให access animation
  Animation get animation => this._animation;

  @override
  void onInit() {
    _animationController =
        AnimationController(duration: Duration(seconds: 30), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        // update like setState
        update();
      });

    // Start our animation
    _animationController.forward();

    super.onInit();
  }
}
