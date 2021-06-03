import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_web_02/constants.dart';
import 'package:flutter_web_02/controllers/question_controller.dart';
import 'package:get/get.dart';

class ScoreScreen extends StatelessWidget {
  QuestionController _qnController = Get.put(QuestionController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: [
        SvgPicture.asset(
          'assets/icons/bg.svg',
          fit: BoxFit.fill,
          alignment: Alignment.center,
          width: size.width,
          height: size.height,
        ),
        Column(
          children: [
            Spacer(),
            Text("Score",
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(color: kSecondaryColor)),
            Spacer(),
            Text(
                '${_qnController.correctAns * 10}/${_qnController.questions.length * 10}',
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(color: kSecondaryColor)),
            Spacer(flex: 3),
          ],
        )
      ],
    ));
  }
}
