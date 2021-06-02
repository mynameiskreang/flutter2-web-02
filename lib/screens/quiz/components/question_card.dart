import 'package:flutter/material.dart';
import 'package:flutter_web_02/constants.dart';
import 'package:flutter_web_02/models/questions.dart';
import 'package:flutter_web_02/screens/quiz/components/option.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key? key,
    required this.question,
  }) : super(key: key);

  final Question question;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(25)),
      child: Column(
        children: [
          Text(sample_data[0]['question'],
              // style: TextStyle(color: kBlackColor),
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: kBlackColor)),
          // QuestionCard(),
          SizedBox(
            height: kDefaultPadding / 2,
          ),
          Option(),
          Option(),
          Option()
        ],
      ),
    );
  }
}
