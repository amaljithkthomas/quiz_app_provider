import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/data/question_answer.dart';
import 'package:quiz_app/screens/question_screen.dart';

class ResultScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('TRIVIA APP'),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Column(
                children: [
                  Text(
                    'Your Result :',
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    '8/10',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.blueAccent),
                  )
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (BuildContext ctx) =>
                        QuestionScreen(),
                  ),
                );
                Provider.of<ApiData>(context).resetQuestion();
              },
              child: Text(
                'Retake Trivia',
                style: TextStyle(color: Colors.blue.shade600),
              ),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.orangeAccent)),
            ),
          ],
        ),
      ),
    );
  }
}
