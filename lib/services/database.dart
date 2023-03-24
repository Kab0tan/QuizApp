import 'package:cloud_firestore/cloud_firestore.dart';


class DataBaseService {

  final String? qid;

  DataBaseService({this.qid});
  final CollectionReference quizcollection = FirebaseFirestore.instance.collection('quiz');

  Future<void> addData(userData) async {
    FirebaseFirestore.instance.collection("users").add(userData).catchError((e) {
      print(e);
    });
  }

  Future<void> addQuizData(Map<String, dynamic> quizData, String quizId) async {
    await FirebaseFirestore.instance
        .collection("Quiz")
        .doc(quizId)
        .set(quizData)
        .catchError((e) {
      print(e);
    });
  }


  Future updateQuiz(String name) async {
    return await quizcollection.doc(qid).set({
      'name' : name,
    });
  }

  Future<void> addQuestionData(quizData, String quizId) async {
    await FirebaseFirestore.instance
        .collection("Quiz")
        .doc(quizId)
        .collection("QNA")
        .add(quizData)
        .catchError((e) {
      print(e);
    });
  }
  Future<void> updateQuestionData(questionData, String questionId, String quizId) async {
    await FirebaseFirestore.instance
        .collection("Quiz")
        .doc(quizId)
        .collection("QNA")
        .doc(questionId)
        .update(questionData)
        .catchError((e) {
      print(e);
    });
  }


  getQuizData() async {
    return await FirebaseFirestore.instance.collection("Quiz").snapshots();
  }

  getQuestionData(String quizId) async{
    return await FirebaseFirestore.instance
        .collection("Quiz")
        .doc(quizId)
        .collection("QNA")
        .get();
  }






}