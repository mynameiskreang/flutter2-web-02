import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_02/constants.dart';
import 'package:flutter_web_02/controllers/question_controller.dart';
import 'package:flutter_web_02/screens/quiz/components/body.dart';
import 'package:get/get.dart';

class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
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
      body: Body(),
    );
  }
}
