import 'package:flutter/material.dart';
import 'package:flutter2_web_02/constants.dart';
import 'package:flutter2_web_02/screens/quiz/quiz_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(fit: StackFit.expand, children: <Widget>[
        SvgPicture.asset(
          'assets/icons/bg.svg',
          fit: BoxFit.fill,
          alignment: Alignment.center,
          width: size.width,
          height: size.height,
        ),
        Center(
          child: Container(
              constraints: BoxConstraints(maxWidth: 450),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: SafeArea(
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: kDefaultPadding),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Spacer(flex: 2),
                            Text("Let's Play Quiz,",
                                style: Theme.of(context).textTheme.headline4),
                            Text("Enter your information below"),
                            Spacer(),
                            TextField(
                              decoration: InputDecoration(
                                  hintText: "Full Name",
                                  fillColor: kThirdColor,
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12)))),
                            ),
                            Spacer(),
                            InkWell(
                              onTap: () => Get.to(QuizScreen()),
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(kDefaultPadding * 0.75),
                                decoration: BoxDecoration(
                                    gradient: kPrimaryGradient,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12))),
                                child: Text("Let Start Quiz",
                                    style: TextStyle(color: Colors.black)),
                              ),
                            ),
                            Spacer(
                              flex: 2,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )),
        ),
      ]),
    );
  }
}
