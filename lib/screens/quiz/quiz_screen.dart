import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter2_02/constants.dart';
import 'package:flutter2_02/controllers/question_controller.dart';
import 'package:flutter2_02/screens/quiz/components/body.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
              onPressed: _controller.nextQuestion,
              style: flatButtonStyle,
              child: Text('Skip'))
        ],
      ),
      body: Stack(fit: StackFit.expand, children: [
        SvgPicture.asset(
          'assets/icons/bg.svg',
          fit: BoxFit.fill,
          alignment: Alignment.center,
          width: size.width,
          height: size.height,
        ),
        Center(
            child: Container(
                constraints: BoxConstraints(maxWidth: 450), child: Body()))
      ]),
    );
  }
}
