import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_02/constants.dart';
import 'package:flutter_web_02/controllers/question_controller.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class Option extends StatelessWidget {
  Option(
      {Key? key, required this.text, required this.index, required this.press})
      : super(key: key);

  String text = '';
  int index = 0;
  VoidCallback press = () {};

  @override
  Widget build(BuildContext context) {
    // GetBuilder เหมือนจะ stream log ตลอด ไม่ได้เป็น Rx
    return GetBuilder<QuestionController>(
        init: QuestionController(),
        builder: (qnController) {
          Color getTheRightColor() {
            // print('qnController.isAnswered: ${qnController.isAnswered}');
            // print('qnController.correctAns: ${qnController.correctAns}');
            // print('qnController.selectedAns: ${qnController.selectedAns}');
            if (qnController.isAnswered) {
              if (index == qnController.correctAns) {
                return kGreenColor;
              } else if (index == qnController.selectedAns &&
                  qnController.selectedAns != qnController.correctAns) {
                return kRedColor;
              }
            }
            return kGrayColor;
          }

          return InkWell(
            onTap: press,
            child: Container(
              margin: EdgeInsets.only(top: kDefaultPadding),
              padding: EdgeInsets.all(kDefaultPadding),
              decoration: BoxDecoration(
                  border: Border.all(color: getTheRightColor()),
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                children: [
                  Text(
                    '${index + 1} $text',
                    style: TextStyle(color: getTheRightColor(), fontSize: 16),
                  ),
                  Spacer(),
                  Container(
                    height: 26,
                    width: 26,
                    decoration: BoxDecoration(
                        border: Border.all(color: getTheRightColor()),
                        borderRadius: BorderRadius.circular(50)),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
