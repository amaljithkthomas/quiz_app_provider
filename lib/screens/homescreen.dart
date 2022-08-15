import 'package:flutter/material.dart';
import 'package:quiz_app/data/question_answer.dart';

import 'package:quiz_app/screens/question_screen.dart';
import 'package:provider/provider.dart';
var data;

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Future getApiData() async {
    try {
      data = await Provider.of<ApiData>(context,listen: false).getData();
      print(data["results"][questionIndex]["question"]);
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
    //getApiData();
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
