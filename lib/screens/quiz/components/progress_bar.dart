import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_web_02/constants.dart';
import 'package:flutter_web_02/controllers/question_controller.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ProgressBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 35,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 3),
            borderRadius: BorderRadius.circular(50)),
        child: GetBuilder<QuestionController>(
            init: QuestionController(),
            builder: (controller) {
              // print(controller.animation.value);
              return Stack(
                children: [
                  // Layout Builder ทำให้ควบคุม space ของ
                  // constraints.maxWidth เพื่อใช้ทำ animation
                  LayoutBuilder(
                      builder: (context, constraints) => Container(
                            width: constraints.maxWidth *
                                controller.animation.value,
                            decoration: BoxDecoration(
                                gradient: kPrimaryGradient,
                                borderRadius: BorderRadius.circular(50)),
                          )),
                  Positioned.fill(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: kDefaultPadding / 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            "${(controller.animation.value * 60).round()} sec"),
                        SvgPicture.asset('assets/icons/clock.svg')
                      ],
                    ),
                  ))
                ],
              );
            }));
  }
}
