import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class QuestionController extends GetxController
    with SingleGetTickerProviderMixin {

    

    late PageController _pageController;
    PageController get pageController => _pageController;

    bool _isAnswered = false;
    bool get isAnswered => _isAnswered;

    late int _correctAns; 
    int get correctAns => _correctAns;

    late int _selectedAns;
    int get selectedAns => _selectedAns;

    int _numOfCorrectAns = 0;
    int get numOfCorrectAns => _numOfCorrectAns;


}