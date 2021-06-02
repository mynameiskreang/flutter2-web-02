import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_web_02/constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        SvgPicture.asset(
          'assets/icons/bg.svg',
          fit: BoxFit.fill,
          alignment: Alignment.center,
          width: size.width,
          height: size.height,
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 35,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 3),
                      borderRadius: BorderRadius.circular(50)),
                  child: Stack(
                    children: [
                      // Layout Builder ทำให้ควบคุม space ของ
                      // constraints.maxWidth เพื่อใช้ทำ animation
                      LayoutBuilder(
                          builder: (context, constraints) => Container(
                                width: constraints.maxWidth * 0.25,
                                decoration: BoxDecoration(
                                    gradient: kPrimaryGradient,
                                    borderRadius: BorderRadius.circular(50)),
                              ))
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
