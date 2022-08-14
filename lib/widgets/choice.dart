import 'package:flutter/material.dart';
import 'package:quiz_app/screens/question_screen.dart';

class Choice extends StatefulWidget {
  var data;

  Choice({required this.data});

  @override
  State<Choice> createState() => _ChoiceState();
}

class _ChoiceState extends State<Choice> {
  bool choiceSelected = false;
  @override
  Widget build(BuildContext context) {
    List<Widget> choice() {
      List<Widget> choiceWidget = [];
      for (String answer in widget.data["results"][questionIndex]["incorrect_answers"]) {
        var answerWidget = Text(answer);
        //choiceWidget.add(answerWidget);
        var newWidget = Container(
          padding: EdgeInsets.all(15),
          child:

          GestureDetector(
            onTap: (){
              setState(() {
                choiceSelected = true;
              });
            },
            onLongPress: (){
              setState(() {
                choiceSelected = false;
              });
            },
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black, width: 2),
                      color: !choiceSelected?Colors.white:Colors.green),
                ),
                const SizedBox(width: 10,),
                answerWidget
              ],
            ),
          ),
        );
        choiceWidget.add(newWidget);
      }
      return choiceWidget;
    }

    return Column(
      children: [
        Container(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: GestureDetector(
              onTap: (){
                setState(() {
                  choiceSelected = true;
                });
              },
              onLongPress: (){
                setState(() {
                  choiceSelected = false;
                });
              },
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black, width: 2),
                        color: !choiceSelected?Colors.white:Colors.green),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                      '${widget.data["results"][questionIndex]["correct_answer"]}')
                ],
              ),
            ),
          ),
        ),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: choice(),
          ),
        ),
      ],
    );
  }
}