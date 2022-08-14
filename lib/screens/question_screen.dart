import 'package:flutter/material.dart';
import 'package:quiz_app/screens/result_screen.dart';
import 'package:quiz_app/widgets/choice.dart';

int questionIndex = 0;

class QuestionScreen extends StatefulWidget {
  var data;

  QuestionScreen({required this.data});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  bool showResultButton = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('TRIVIA APP'),
        ),
        body: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 40, left: 10, right: 10, bottom: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Question :',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent.shade700),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  '${widget.data["results"][questionIndex]["question"]}',
                  style: TextStyle(fontSize: 17),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Choice',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange),
                ),
                const SizedBox(
                  height: 20,
                ),
                // Container(
                //   child: Padding(
                //     padding: const EdgeInsets.all(15.0),
                //     child: Row(
                //       children: [
                //         Container(
                //           padding: const EdgeInsets.all(10),
                //           decoration: BoxDecoration(
                //               shape: BoxShape.circle,
                //               border: Border.all(color: Colors.black, width: 2),
                //               color: Colors.green),
                //         ),
                //         const SizedBox(
                //           width: 10,
                //         ),
                //         Text(
                //             '${widget.data["results"][questionIndex]["correct_answer"]}')
                //       ],
                //     ),
                //   ),
                // ),
                Choice(data: widget.data),
                const SizedBox(
                  height: 40,
                ),
                !showResultButton
                    ? Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: !showResultButton
                                  ? () {
                                      int questioNumber =
                                          widget.data["results"].length;
                                      setState(() {
                                        if (questionIndex < questioNumber - 1) {
                                          questionIndex = questionIndex + 1;
                                        } else {
                                          showResultButton = true;
                                          print(showResultButton);
                                        }
                                      });

                                      print(questionIndex);
                                    }
                                  : null,
                              child: Text(
                                'Next',
                                style: TextStyle(color: Colors.blue.shade700),
                              ),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      !showResultButton
                                          ? Colors.orangeAccent
                                          : Colors.grey)),
                            ),
                          ],
                        ),
                      )
                    : Container(
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (BuildContext ctx) =>
                                        ResultScreen(
                                          data: widget.data,
                                        ),
                                  ),
                                );
                              },
                              child: Text('Show Result'),
                            ),
                          ],
                        ),
                      )
              ],
            ),
          ),
        ));
  }
}
