import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:test_firebase/services/model_question.dart';
import 'package:test_firebase/services/question_card.dart';

class PlayQuiz extends StatefulWidget {
  final String quizID;
  PlayQuiz(this.quizID);
  int numCorrecAnswer = 0;

  @override
  State<PlayQuiz> createState() => _PlayQuizState();
}



class _PlayQuizState extends State<PlayQuiz> {
  // PageController _questionController = Get.put(PageController());
  PageController _questionController = PageController();

  //defining which database i call with widget.quizID and store the db in the variable "ref"
  late final ref = FirebaseFirestore.instance
      .collection("Quiz")
      .doc(widget.quizID)
      .collection("QNA");

  //callback function for the score
  void updateCorrectAnswers(int value) {
      widget.numCorrecAnswer= value;
  }

  @override
  void dispose() {
    _questionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Play quiz',
            style: TextStyle(
              fontFamily: 'Montserrat',
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w800,
            ),
          ),
          elevation: 2,
        ),
        backgroundColor: Color(0xFF454545),
        body: StreamBuilder(
            stream: ref.snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                List<QueryDocumentSnapshot> MesQuestions = [
                  for (var i = 0; i < snapshot.data!.docs.length; i++)
                    snapshot.data!.docs[i]
                ];
                MesQuestions.shuffle();
                return Container(
                  child: Center(
                    child: PageView.builder(
                      itemCount: snapshot.data!.docs.length,
                      physics: NeverScrollableScrollPhysics(),
                      controller: _questionController,
                      itemBuilder: (context, index) => Questioncard(
                        QuestionModel.fromSnapshot(MesQuestions[index]),
                        _questionController,
                        index,
                        snapshot.data!.docs.length,
                        widget.numCorrecAnswer,

                        //callback function to update score
                        updateCorrectAnswers,
                      ),
                    ),

                   
                  ),
                );
              } 
              else {
                return const CircularProgressIndicator();
              }
            }));
  }
}
