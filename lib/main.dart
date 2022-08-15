import 'package:flutter/material.dart';
import 'package:quiz_app/data/question_answer.dart';
import 'package:quiz_app/screens/homescreen.dart';
import 'package:provider/provider.dart';
void main()
{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>ApiData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue
        ),
        home: HomeScreen(),
      ),
    );
  }
}
