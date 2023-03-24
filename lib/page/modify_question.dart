import 'package:flutter/material.dart';
import 'package:test_firebase/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
  
class ModifyQuestion extends StatefulWidget {
  final String quizId;
  final String questionId;
  ModifyQuestion(this.quizId, this.questionId);

  @override
  _ModifyQuestionState createState() => _ModifyQuestionState();
}

class _ModifyQuestionState extends State<ModifyQuestion> {
  DataBaseService databaseService = new DataBaseService();
  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  late String _question;
  late String _option1;
  late String _option2;
  late String _option3;
  late String _option4;

  @override
  void initState() {
    super.initState();

    FirebaseFirestore.instance
        .collection("Quiz")
        .doc(widget.quizId)
        .collection("QNA")
        .doc(widget.questionId)
        .get()
        .then((docSnapshot) {
      setState(() {
        _question = docSnapshot.data()!['question'];
        _option1 = docSnapshot.data()!['option1'];
        _option2 = docSnapshot.data()!['option2'];
        _option3 = docSnapshot.data()!['option3'];
        _option4 = docSnapshot.data()!['option4'];
      });
    }).catchError((error) {
      print("Failed to load question: $error");
    });
  }

  updateQuizData() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });

      Map<String, String> questionMap = {
        "question": _question,
        "option1": _option1,
        "option2": _option2,
        "option3": _option3,
        "option4": _option4
      };

      print("${widget.quizId}");
      databaseService
          .updateQuestionData(questionMap, widget.questionId, widget.quizId)
          .then((value) {
        _question = "";
        _option1 = "";
        _option2 = "";
        _option3 = "";
        _option4 = "";
        setState(() {
          isLoading = false;
        });
      }).catchError((e) {
        print(e);
      });
    } else {
      print("error is happening ");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF454545),
      //backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Modifier une question',
          style: TextStyle(
            fontFamily: 'Montserrat',
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w800,
          ),
        ),
        elevation: 2,
      ),
      body: isLoading
          ? Container(
              child: Center(child: CircularProgressIndicator()),
            )
          : Form(
              key: _formKey,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ListView(
                  children: [
                    TextFormField(
                      initialValue: _question,
                      validator: (val) =>
                          val!.isEmpty ? "Enter Question" : null,
                      style: const TextStyle(color: Colors.white, fontSize: 25),
                      decoration: const InputDecoration(
                        hintText: "Question",
                        hintStyle: TextStyle(
                            color: Color.fromARGB(127, 255, 255, 255),
                            fontSize: 25),
                      ),
                      maxLines: null, 
                      onChanged: (val) {
                        _question = val;
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      initialValue: _option1,
                      validator: (val) => val!.isEmpty ? "Option1 " : null,
                      style: const TextStyle(color: Colors.white, fontSize: 25),
                      decoration: const InputDecoration(
                        hintText: "Option1 (Correct Answer)",
                        hintStyle: TextStyle(
                            color: Color.fromARGB(127, 255, 255, 255)),
                      ),
                      onChanged: (val) {
                        _option1 = val;
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      initialValue: _option2,
                      validator: (val) => val!.isEmpty ? "Option2 " : null,
                      style: const TextStyle(color: Colors.white, fontSize: 25),
                      onChanged: (val) {
                        _option2 = val;
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      initialValue: _option3,
                      validator: (val) => val!.isEmpty ? "Option3 " : null,
                      style: const TextStyle(color: Colors.white, fontSize: 25),
                      decoration: const InputDecoration(
                        hintText: "Option3",
                        hintStyle: TextStyle(
                            color: Color.fromARGB(127, 255, 255, 255)),
                      ),
                      onChanged: (val) {
                        _option3 = val;
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      initialValue: _option4,
                      validator: (val) => val!.isEmpty ? "Option4 " : null,
                      style: const TextStyle(color: Colors.white, fontSize: 25),
                      decoration: const InputDecoration(
                        hintText: "Option4",
                        hintStyle: TextStyle(
                            color: Color.fromARGB(127, 255, 255, 255)),
                      ),
                      onChanged: (val) {
                        _option4 = val;
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    //Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            updateQuizData();
                            Navigator.pop(context);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width / 2 - 40,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(30)),
                            child: const Text(
                              "Save Question",
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
