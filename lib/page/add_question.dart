import 'package:flutter/material.dart';
import 'package:test_firebase/services/database.dart';

class AddQuestion extends StatefulWidget {
  final String quizId;
  AddQuestion(this.quizId);

  @override
  _AddQuestionState createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
  DataBaseService databaseService = new DataBaseService();
  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  String question = "", option1 = "", option2 = "", option3 = "", option4 = "";

  uploadQuizData() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });

      Map<String, String> questionMap = {
        "question": question,
        "option1": option1,
        "option2": option2,
        "option3": option3,
        "option4": option4
      };

      print("${widget.quizId}");
      databaseService.addQuestionData(questionMap, widget.quizId).then((value) {
        question = "";
        option1 = "";
        option2 = "";
        option3 = "";
        option4 = "";
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
          'Ajouter une question',
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
                      validator: (val) =>
                          val!.isEmpty ? "Enter Question" : null,
                      style: const TextStyle(color: Colors.white, fontSize: 25),
                      decoration: const InputDecoration(
                        hintText: "Question",
                        hintStyle: TextStyle(color: Color.fromARGB(127, 255, 255, 255), fontSize: 25),
                      ),
                      onChanged: (val) {
                        question = val;
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      validator: (val) => val!.isEmpty ? "Option1 " : null,
                      style: const TextStyle(color: Colors.white, fontSize: 25),
                      decoration: const InputDecoration(
                        hintText: "Option1 (Correct Answer)",
                        hintStyle: TextStyle(color: Color.fromARGB(127, 255, 255, 255)),
                      ),
                      onChanged: (val) {
                        option1 = val;
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      validator: (val) => val!.isEmpty ? "Option2 " : null,
                      style: const TextStyle(color: Colors.white, fontSize: 25),
                      decoration: const InputDecoration(
                        hintText: "Option2",
                        hintStyle: TextStyle(color: Color.fromARGB(127, 255, 255, 255)),
                      ),
                      onChanged: (val) {
                        option2 = val;
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      validator: (val) => val!.isEmpty ? "Option3 " : null,
                      style: const TextStyle(color: Colors.white, fontSize: 25),
                      decoration: const InputDecoration(
                        hintText: "Option3",
                        hintStyle: TextStyle(color: Color.fromARGB(127, 255, 255, 255)),
                      ),
                      onChanged: (val) {
                        option3 = val;
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      validator: (val) => val!.isEmpty ? "Option4 " : null,
                      style: const TextStyle(color: Colors.white, fontSize: 25),
                      decoration: const InputDecoration(
                        hintText: "Option4",
                        hintStyle: TextStyle(color: Color.fromARGB(127, 255, 255, 255)),
                      ),
                      onChanged: (val) {
                        option4 = val;
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    //Spacer(),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width / 2 - 20,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(30)),
                            child: const Text(
                              "Submit",
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        GestureDetector(
                          onTap: () {
                            uploadQuizData();
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
