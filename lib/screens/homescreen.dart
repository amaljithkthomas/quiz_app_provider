import 'package:flutter/material.dart';
import 'package:quiz_app/data/question_answer.dart';

import 'package:quiz_app/screens/question_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var data;

  Future getApiData() async {
    try {
      data = await getData();
      print(data["results"][0]["question"]);
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    getApiData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'TRIVIA APP',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 35),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (BuildContext ctx) => QuestionScreen(
                            data: data,
                          )));
                },
                icon: Text(
                  'TAKE TRIVIA',
                  style: TextStyle(color: Colors.blue.shade600),
                ),
                label: Icon(
                  Icons.arrow_forward,
                  color: Colors.blue.shade600,
                ),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.orangeAccent)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
