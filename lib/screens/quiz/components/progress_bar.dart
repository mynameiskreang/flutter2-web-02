import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_web_02/constants.dart';

class ProgressBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                  )),
          Positioned.fill(
              child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("18 sec"),
                SvgPicture.asset('assets/icons/clock.svg')
              ],
            ),
          ))
        ],
      ),
    );
  }
}
