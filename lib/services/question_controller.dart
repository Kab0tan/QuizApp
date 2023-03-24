import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class QuestionController extends GetxController
    with SingleGetTickerProviderMixin {

    

    late PageController _pageController;
    PageController get pageController => this._pageController;

    bool _isAnswered = false;
    bool get isAnswered => this._isAnswered;

    late int _correctAns; 
    int get correctAns => this._correctAns;

    late int _selectedAns;
    int get selectedAns => this._selectedAns;

    int _numOfCorrectAns = 0;
    int get numOfCorrectAns => this._numOfCorrectAns;


    /* void nextQuestion(int index , int total_length) {
      if ( index != total_length) {
        _isAnswered = false;
        _pageController.nextPage(
            duration: Duration(milliseconds: 250), curve: Curves.ease);
      } 
      else {
        // Get package provide us simple way to naviigate another page
        Get.to(ScoreScreen(total_length));
      }
    } */


    /* void checkAns(QueryDocumentSnapshot question, int selectedIndex, int length) {
      // because once user press any option then it will run
      _isAnswered = true;
      _correctAns = question[selectedIndex]['option1'];
      _selectedAns = selectedIndex;

      if (_correctAns == _selectedAns) _numOfCorrectAns++;


      // Once user select an ans after 3s it will go to the next qn
      Future.delayed(Duration(seconds: 3), () {
        nextQuestion(selectedIndex, length);
      }
    ); 
  }*/
















}