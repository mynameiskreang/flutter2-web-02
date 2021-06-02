import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_web_02/constants.dart';
import 'package:flutter_web_02/screens/quiz/components/progress_bar.dart';

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
              children: [ProgressBar()],
            ),
          ),
        )
      ],
    );
  }
}
