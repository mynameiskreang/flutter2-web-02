import 'package:flutter/material.dart';
import 'package:flutter2_02/constants.dart';
import 'package:flutter2_02/controllers/question_controller.dart';
import 'package:flutter2_02/models/questions.dart';
import 'package:flutter2_02/screens/quiz/components/option.dart';
import 'package:get/get.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key? key,
    required this.question,
  }) : super(key: key);

  final Question question;

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(25)),
      child: Column(
        children: [
          Text(question.question,
              // style: TextStyle(color: kBlackColor),
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: kBlackColor)),
          // QuestionCard(),
          SizedBox(
            height: kDefaultPadding / 2,
          ),
          ...List.generate(
              question.options.length,
              (index) => Option(
                  text: question.options[index],
                  index: index,
                  press: () {
                    print(question.options[index]);
                    print(question);
                    _controller.checkAns(question, index);
                  }))
        ],
      ),
    );
  }
}
