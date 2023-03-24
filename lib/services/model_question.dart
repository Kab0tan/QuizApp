import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionModel{

  late String question;
  late String option1;
  late String option2;
  late String option3;
  late String option4;
  late String correctOption;
  bool answered = false;
  QuestionModel.fromSnapshot(QueryDocumentSnapshot json) : 
    question = json['question'],
    option1 = json['option1'], 
    option2 = json['option2'], 
    option3 = json['option3'], 
    option4 = json['option4'];

}
