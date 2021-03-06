import 'package:flutter/material.dart';
import 'package:flutter_web_02/constants.dart';
import 'package:flutter_web_02/controllers/question_controller.dart';
import 'package:flutter_web_02/screens/quiz/components/progress_bar.dart';
import 'package:flutter_web_02/screens/quiz/components/question_card.dart';
import 'package:get/get.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuestionController _questionController = Get.put(QuestionController());
    Size size = MediaQuery.of(context).size;
    return Stack(
      fit: StackFit.expand,
      children: [
        // SvgPicture.asset(
        //   'assets/icons/bg.svg',
        //   fit: BoxFit.fill,
        //   alignment: Alignment.center,
        //   width: size.width,
        //   height: size.height,
        // ),
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: ProgressBar()),
              SizedBox(
                height: kDefaultPadding,
              ),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: Obx(
                    () => Text.rich(TextSpan(
                        text:
                            'Question ${_questionController.questionNumber.value}',
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(color: kSecondaryColor),
                        children: [
                          TextSpan(
                              text: '/${_questionController.questions.length}',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(color: kSecondaryColor))
                        ])),
                  )),
              Divider(
                thickness: 1.5,
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              Expanded(
                  child: PageView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      controller: _questionController.pageController,
                      onPageChanged: _questionController.updateTheQnNum,
                      itemCount: _questionController.questions.length,
                      itemBuilder: (context, index) => QuestionCard(
                            question: _questionController.questions[index],
                          ))),
            ],
          ),
        )
      ],
    );
  }
}
