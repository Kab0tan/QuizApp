import 'package:flutter/material.dart';
import 'package:test_firebase/page/create_quiz.dart';


class PageMenuCreationQUizWidget extends StatefulWidget {
  const PageMenuCreationQUizWidget({Key? key}) : super(key: key);

  @override
  _PageMenuCreationQUizWidgetState createState() =>
      _PageMenuCreationQUizWidgetState();
}

class _PageMenuCreationQUizWidgetState
    extends State<PageMenuCreationQUizWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: true,
        title: const Text(
          'Page création de quiz',
          style: TextStyle(
                fontFamily: 'Montserrat',
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w800,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      backgroundColor: Color(0xFF454545),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.1,
                    decoration: BoxDecoration(
                      color: Color(0xFFBCF2B8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: const AlignmentDirectional(0, 0),
                    child: const Text(
                      'Créer Quiz',
                      style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 28,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 100, 0, 0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.black,
                      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 30),
                      textStyle:
                        const TextStyle(
                          fontSize: 30, 
                          fontWeight: FontWeight.bold,
                          ),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                      shadowColor: Colors.black,
                      elevation:10,
                    ),
                    onPressed: () {},
                    child: const Text('Importer Excel'),
                  ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                child: 
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.black,
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                      textStyle:
                        const TextStyle(
                          fontSize: 30, 
                          fontWeight: FontWeight.bold,
                          ),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                      shadowColor: Colors.black,
                      elevation:10,
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CreateQuiz() )
          );
                    },/*async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    PageQuizPersonnaliseWidget(),
                              ),
                            );
                          },*/
                    child: const Text('Quiz Personnalisé'),
                  ),
                ),
              
            ],
          ),
        ),
      ),
    );
  }
}
