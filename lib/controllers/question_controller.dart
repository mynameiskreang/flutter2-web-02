import 'package:flutter/animation.dart';
import 'package:flutter_web_02/models/questions.dart';
import 'package:get/get.dart';

// ใช้สำหรับจัดการ state

class QuestionController extends GetxController
    with SingleGetTickerProviderMixin {
  // animation progress bar

  // Refer late from
  // https://flutter.dev/docs/development/ui/animations/tutorial#animationcontroller#rendering-animations
  late AnimationController _animationController;
  late Animation _animation;

  List<Question> _questions = sample_data
      .map((question) => Question(
          id: question['id'],
          answer: question['answer_index'],
          question: question['question'],
          options: question['options']))
      .toList();

  List<Question> get questions => this._questions;

  bool _isAnswered = false;
  bool get isAnswered => this._isAnswered;

  int _correctAns = 0;
  int get correctAns => this._correctAns;

  int _selectAns = 0;
  int get selectedAns => this._selectAns;

  // RxInt เป็น type ของ package get
  // https://pub.dev/packages/get
  // obs คือ make any variable observable
  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => this._questionNumber;

  int _numOfCorrectAns = 0;
  int get numbOfCorrectAns => this._numOfCorrectAns;

  // บรรทัด 12 ทำให access animation
  Animation get animation => this._animation;

  @override
  void onInit() {
    _animationController =
        AnimationController(duration: Duration(seconds: 30), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        // update like setState
        update();
      });

    // Start our animation
    _animationController.forward();

    super.onInit();
  }

  void checkAns(Question question, int selectedIndex) {
    _isAnswered = true;
    _correctAns = question.answer;
    _selectAns = selectedIndex;

    if (_correctAns == _selectAns) _numOfCorrectAns++;

    _animationController.stop();

    update();
  }
}
