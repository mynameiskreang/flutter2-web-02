import 'package:flutter/widgets.dart';
import 'package:flutter_web_02/models/questions.dart';
import 'package:flutter_web_02/screens/score/score_screen.dart';
import 'package:get/get.dart';

// ใช้สำหรับจัดการ state

class QuestionController extends GetxController
    with SingleGetTickerProviderMixin {
  // animation progress bar

  // Refer late from
  // https://flutter.dev/docs/development/ui/animations/tutorial#animationcontroller#rendering-animations
  late AnimationController _animationController;
  late Animation _animation;

  late PageController _pageController;

  PageController get pageController => this._pageController;

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
    _animationController.forward().whenComplete(() => nextQuestion());
    _pageController = PageController();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    _animationController.dispose();
    _pageController.dispose();
  }

  void checkAns(Question question, int selectedIndex) {
    _isAnswered = true;
    _correctAns = question.answer;
    _selectAns = selectedIndex;

    print(_correctAns);
    print(_selectAns);
    if (_correctAns == _selectAns) _numOfCorrectAns++;

    _animationController.stop();
    update();

    Future.delayed(Duration(seconds: 1), () {
      nextQuestion();
    });
  }

  void nextQuestion() {
    if (_questionNumber.value != _questions.length) {
      _isAnswered = false;
      _pageController.nextPage(
          duration: Duration(microseconds: 100), curve: Curves.ease);

      _animationController.reset();
      _animationController.forward().whenComplete(() => nextQuestion());
    } else {
      Get.to(ScoreScreen());
    }
  }

  void updateTheQnNum(int index) {
    _questionNumber.value = index + 1;
  }
}
