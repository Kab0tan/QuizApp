import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:test_firebase/page/add_question.dart';
import 'package:test_firebase/page/modify_question.dart';

class QuestionList extends StatefulWidget {
  final String quizID;
  QuestionList(this.quizID);

  @override
  State<QuestionList> createState() => _QuestionListState();
}

class _QuestionListState extends State<QuestionList> {
  void initState() {
    print("${widget.quizID}");
    super.initState();
  }

  late final ref = FirebaseFirestore.instance
      .collection("Quiz")
      .doc(widget.quizID)
      .collection("QNA");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Liste Questions',
          style: TextStyle(
            fontFamily: 'Montserrat',
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w800,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.add_to_photos_rounded,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AddQuestion(widget.quizID)));
            },
          )
        ],
        elevation: 2,
      ),
      backgroundColor: Color(0xFF454545),
      body: StreamBuilder(
        stream: ref.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                physics: ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(5, 10, 5, 0),
                    child: Container(
                        width: 100,
                        // height: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20, 20, 20, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 0, 5),
                                child: Text(
                                  snapshot.data!.docs[index]['question'],
                                  style: const TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                              Text(
                                snapshot.data!.docs[index]['option1'],
                                style: const TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                snapshot.data!.docs[index]['option2'],
                                style: const TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                snapshot.data!.docs[index]['option3'],
                                style: const TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                snapshot.data!.docs[index]['option4'],
                                style: const TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 18,
                                ),
                              ),
                              ButtonBar(children: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ModifyQuestion(widget.quizID, snapshot.data!.docs[index].id)));
                                    },
                                    child: const Text(
                                      'Modifier',
                                      style: TextStyle(fontSize: 18),
                                    )),
                                TextButton(
                                    onPressed: () => showDialog<String>(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              AlertDialog(
                                            title: const Text(
                                                'Supprimer Question ?',
                                                style: TextStyle(
                                                    fontFamily: 'Montserrat',
                                                    fontWeight:
                                                        FontWeight.w700)),
                                            content: const Text(
                                                'Voulez-vous supprimer la question ?'),
                                            actions: <Widget>[
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    context, 'Non'),
                                                child: const Text('Non',
                                                    style: TextStyle(
                                                        color: Colors.red)),
                                              ),
                                              TextButton(
                                                onPressed: () => [
                                                  Navigator.pop(context, 'Oui'),
                                                  ref
                                                      .doc(snapshot
                                                          .data!.docs[index].id)
                                                      .delete()
                                                      .then((_) =>
                                                          print('Deleted'))
                                                      .catchError((error) => print(
                                                          'Delete failed: $error'))
                                                ],
                                                child: const Text('Oui'),
                                              ),
                                            ],
                                          ),
                                        ),
                                    child: const Text(
                                      'Delete',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.red,
                                      ),
                                    )),
                              ])
                            ],
                          ),
                        )),
                  );
                });
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
