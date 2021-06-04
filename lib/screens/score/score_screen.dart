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
            Text(
                "Score ${_qnController.numbOfCorrectAns * 10}/${_qnController.questions.length * 10}",
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(color: kSecondaryColor)),
            Spacer(),
            Text(
              checkScore(_qnController.numbOfCorrectAns * 10,
                  _qnController.questions.length * 10),
              textAlign: TextAlign.center,
              textScaleFactor: 2,
            ),
            Spacer(),
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network(
                'https://media.giphy.com/media/8FUmlOoL72HB3rR7wm/giphy.gif',
              ),
            ),
            Spacer(flex: 3),
          ],
        )
      ],
    ));
  }

  checkScore(numbOfCorrectAns, questionsLength) {
    if (numbOfCorrectAns == questionsLength) {
      return 'คุณผ่านแหละ! ยินดีด้วยจริงๆ!';
    } else {
      return 'คุณไม่ผ่านนะ! \n我要让你们去外国家。';
    }
  }
}
