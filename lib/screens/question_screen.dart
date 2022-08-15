import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/data/question_answer.dart';
import 'package:quiz_app/screens/homescreen.dart';
import 'package:quiz_app/screens/result_screen.dart';
import 'package:quiz_app/widgets/choice.dart';


int questionIndex = 0;
bool showResultButton = false;
class QuestionScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    //getData(context);
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
                  '${data["results"][questionIndex]["question"]}',
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
                Choice(),
                const SizedBox(
                  height: 40,
                ),
                !showResultButton
                    ? Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Consumer<ApiData>(
                              builder: (context,apiData,Widget?child){
                                return ElevatedButton(
                                  onPressed:  () {
                                    int questioNumber =
                                        data["results"].length;

                                    if (questionIndex < questioNumber - 1) {
                                      apiData.nextQuestion();
                                      print(data["results"][questionIndex]["question"]);
                                    } else {
                                      apiData.resultButton();
                                      print(showResultButton);
                                    }


                                    print(questionIndex);
                                  },

                                  child: Text(
                                    'Next',
                                    style: TextStyle(color: Colors.blue.shade700),
                                  ),
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(
                                          !showResultButton
                                              ? Colors.orangeAccent
                                              : Colors.grey)),
                                );
                              },

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
