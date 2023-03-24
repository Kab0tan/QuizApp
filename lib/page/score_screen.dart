import 'package:flutter/material.dart';
import 'package:test_firebase/page/home.dart';

class ScoreScreen extends StatefulWidget {
  final int length_, total;
  PageController _questionController;
  ScoreScreen(this.length_, this.total, this._questionController);

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF454545),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            children: [
              Spacer(flex: 3),
              Text(
                "Score",
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(color: Colors.white),
              ),
              Spacer(),
              Text(
                "${widget.total}/${widget.length_}",
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: Colors.white),
              ),
              const Spacer(flex: 2),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                },
                child: const Text('Go to Menu',style: TextStyle(fontSize: 20),),
              ),
              Spacer(),
            ],
          )
        ],
      ),
    );
  }
}
