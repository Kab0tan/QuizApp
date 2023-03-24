import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:test_firebase/page/quiz_play.dart';
import 'package:test_firebase/page/question_list.dart';

class QuizList extends StatefulWidget {
  @override
  State<QuizList> createState() => _QuizListState();
}

class _QuizListState extends State<QuizList> {
  final ref = FirebaseFirestore.instance.collection("Quiz");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Liste Quiz',
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
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                physics: ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(5, 10, 5, 0),
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    15, 0, 10, 0),
                                child: AutoSizeText(
                                  snapshot.data!.docs[index]['quizTitle'],
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 25,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            /*Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 10, 0),
                                    child: ElevatedButton(
                                      onPressed: () => showDialog<String>(
                                        context: context,
                                        builder: (BuildContext context) => AlertDialog(
                                          title: const Text('Supprimer quiz ?',style: TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.w700)),
                                          content: const Text('Voulez-vous supprimer le quiz entier?'),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () => Navigator.pop(context, 'Non'),
                                              child: const Text('Non', style: TextStyle(color: Colors.red)),
                                            ),
                                            TextButton(
                                              onPressed: 
                                              () => [Navigator.pop(context, 'Oui'), ref.doc(snapshot.data!.docs[index]['quizID']).delete().then((_) => print('Deleted')).catchError((error) => print('Delete failed: $error'))],
                                              child: const Text('Oui'),
                                            ),
                                          ],
                                        ),
                                      ),
      
                                      child: Icon(Icons.delete, color: Colors.white, size: 35),
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                          padding: EdgeInsets.all(5),
                                          primary: Colors.red, // <-- Button color
                                           // <-- Splash color
                                        ),
                                      ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 10, 0),
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        
                                      },
                                      child: Icon(Icons.list_alt_rounded, color: Colors.white, size: 35),
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                          padding: EdgeInsets.all(5),
                                          primary: Colors.blue, // <-- Button color
                                          onPrimary: Colors.red, // <-- Splash color
                                        ),
                                      ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 10, 0),
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        //print(snapshot.data!.docs[index]);
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => QuestionList(
                                                snapshot.data!.docs[index]['quizID']),
                                          ),
                                        );
                                      },
                                      child: Icon(Icons.arrow_forward_ios_rounded, color: Colors.white, size: 35),
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                          padding: EdgeInsets.all(5),
                                          primary: Colors.blue, // <-- Button color
                                          onPrimary: Colors.red, // <-- Splash color
                                        ),
                                      ),
                                  ),
                                  */

                            Flexible(
                              child: GridView.count(
                                crossAxisCount: 2,
                                primary: false,
                                padding: const EdgeInsets.all(4),
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 5,
                                childAspectRatio: 1.4,
                                children: [
                                  ElevatedButton(
                                    onPressed: () async {
                                      //print(snapshot.data!.docs[index]);
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => QuestionList(
                                              snapshot.data!.docs[index]
                                                  ['quizID']),
                                        ),
                                      );
                                    },
                                    child: Center(
                                        child: Icon(Icons.list_alt_rounded,
                                            color: Colors.white, size: 35)),
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      padding: const EdgeInsets.only(left:2),
                                      primary: Colors.blue, // <-- Button color
                                      onPrimary: Colors.red, // <-- Splash color
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () async {
                                      await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => PlayQuiz(
                                                  snapshot.data!.docs[index]
                                                      ['quizID'])));
                                    },
                                    child: Icon(Icons.arrow_forward_ios_rounded,
                                        color: Colors.white, size: 35),
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      padding: EdgeInsets.all(5),
                                      primary: Colors.green, // <-- Button color
                                      // <-- Splash color
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () => showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                        title: const Text('Supprimer quiz ?',
                                            style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w700)),
                                        content: const Text(
                                            'Voulez-vous supprimer le quiz entier?'),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context, 'Non'),
                                            child: const Text('Non',
                                                style: TextStyle(
                                                    color: Colors.red)),
                                          ),
                                          TextButton(
                                            onPressed: () => [
                                              Navigator.pop(context, 'Oui'),
                                              ref
                                                  .doc(snapshot.data!
                                                      .docs[index]['quizID'])
                                                  .delete()
                                                  .then((_) => print('Deleted'))
                                                  .catchError((error) => print(
                                                      'Delete failed: $error'))
                                            ],
                                            child: const Text('Oui'),
                                          ),
                                        ],
                                      ),
                                    ),
                                    child: Icon(Icons.delete,
                                        color: Colors.white, size: 35),
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      padding: EdgeInsets.all(5),
                                      primary: Colors.red, // <-- Button color
                                      // <-- Splash color
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
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
