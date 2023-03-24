import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:test_firebase/page/score_screen.dart';
import 'package:test_firebase/services/model_question.dart';

class Questioncard extends StatefulWidget {
  final QuestionModel questionModel;
  PageController _questionController;
  int index;
  int tot_length;
  int numCorrecAnswer;
  final void Function(int) updateCorrectAnswers; //for the callback function to save score
  

  Questioncard(
      this.questionModel,
      this._questionController,
      this.index,
      this.tot_length,
      this.numCorrecAnswer,
      this.updateCorrectAnswers //for the callback function to save score
      );

  @override
  State<Questioncard> createState() => _QuestioncardState();
}

class _QuestioncardState extends State<Questioncard> {
  
  void NextQuestion(int total) {
    if (widget.index != widget.tot_length - 1) {
      Future.delayed(const Duration(seconds: 2), () {
        widget._questionController.nextPage(
            duration: const Duration(milliseconds: 250), curve: Curves.ease);
      });
    } else {
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ScoreScreen(widget.tot_length, total, widget._questionController)));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> options = [
      widget.questionModel.option1,
      widget.questionModel.option2,
      widget.questionModel.option3,
      widget.questionModel.option4,
    ];
    options.shuffle();

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          flex: 1,
          child: Align(
            alignment: AlignmentDirectional(0, 0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
              child: Text(
                widget.questionModel.question, //affichage de la question
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Montserrat',
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        QuestionTile( //première option
          options[0],
          widget.questionModel.option1,
          widget._questionController,
          widget.numCorrecAnswer,
          widget.tot_length,
          widget.index,
          widget.questionModel.answered,
          widget.updateCorrectAnswers, //for the callback function
          NextQuestion,
        ),
        QuestionTile( //deuxième option
          options[1],
          widget.questionModel.option1,
          widget._questionController,
          widget.numCorrecAnswer,
          widget.tot_length,
          widget.index,
          widget.questionModel.answered,
          widget.updateCorrectAnswers, //for the callback function
          NextQuestion,
        ),
        QuestionTile( //troisième option
          options[2],
          widget.questionModel.option1,
          widget._questionController,
          widget.numCorrecAnswer,
          widget.tot_length,
          widget.index,
          widget.questionModel.answered,
          widget.updateCorrectAnswers, //for the callback function
          NextQuestion,
        ),
        QuestionTile( //quatrième option
          options[3],
          widget.questionModel.option1,
          widget._questionController,
          widget.numCorrecAnswer,
          widget.tot_length,
          widget.index,
          widget.questionModel.answered,
          widget.updateCorrectAnswers, //for the callback function
          NextQuestion,
        ),
      ],
    );
  }

}

class QuestionTile extends StatefulWidget {
  final String opt;
  final String answer;
  PageController _questionController;
  int numCorrecAnswer;
  final int totLength;
  int index;
  bool goodAnswer;
  final void Function(int) updateCorrectAnswers; //for the callback function to save score
  final void Function(int) NextQuestion; // declare NextQuestion as a callback

  QuestionTile(
    this.opt,
    this.answer,
    this._questionController,
    this.numCorrecAnswer,
    this.totLength,
    this.index,
    this.goodAnswer,
    this.updateCorrectAnswers, //for the callback function to save score
    this.NextQuestion, //to call function from _QuestioNCardState
  );

  @override
  State<QuestionTile> createState() => _QuestionTileState();
}

class _QuestionTileState extends State<QuestionTile> {
  bool color_status = false;
  bool good_answer = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
        child: StatefulBuilder(builder: (_context, _setState) {
          return GestureDetector(
            onTap: () {
              setState(() {
                if (widget.opt == widget.answer) {
                  good_answer = !good_answer;

                  // Call the callback function to update numCorrectAnswers in the parent widget
                  widget.numCorrecAnswer++;
                  widget.updateCorrectAnswers(widget.numCorrecAnswer);

                  widget.goodAnswer == true;
                  
                }
                // Change color when tapped.
                else {
                  color_status = !color_status;
                }
              });
              widget.NextQuestion(widget.numCorrecAnswer); //call function in _QuestionCardState to go to scorescreen or next question
            },

            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.1,
              decoration: BoxDecoration(
                color: color_status
                    ? Color.fromARGB(255, 211, 17, 17)
                    : good_answer
                        ? Color.fromARGB(255, 20, 113, 33)
                        : Color(0xFFEEEEEE),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 4,
                    color: Color(0x59000000),
                    offset: Offset(0, 4),
                  )
                ],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Align(
                alignment: AlignmentDirectional(0, 0),
                child: AutoSizeText(
                  widget.opt,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: color_status
                          ? Color(0xFFEEEEEE)
                          : good_answer
                              ? Color(0xFFEEEEEE)
                              : Colors.black,
                      fontFamily: 'Montserrat',
                      fontSize: 25,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          );
        }));
  }



  
}
