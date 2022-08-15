
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:quiz_app/screens/homescreen.dart';
import 'package:quiz_app/screens/question_screen.dart';



class ApiData extends ChangeNotifier{
  Future getData()
  async{
    var url = Uri.parse("https://opentdb.com/api.php?amount=10&category=21");
    try
    {
      final response = await http.get(url);
      String data = response.body;

      final jsonResult = jsonDecode(data);
      //print(jsonResult["results"][0]["question"]);
      return jsonResult;
    }catch(e)
    {
      print(e);
    }
  }
  void nextQuestion()
  {
    questionIndex = questionIndex +1;
    notifyListeners();
  }
  void resetQuestion()
  {
    questionIndex = 0;
    notifyListeners();
  }
  void resultButton()
  {
    showResultButton =true;
    notifyListeners();
  }

}
// Future getData()
// async{
//   var url = Uri.parse("https://opentdb.com/api.php?amount=10&category=21");
//   try
//   {
//     final response = await http.get(url);
//     String data = response.body;
//
//     final jsonResult = jsonDecode(data);
//     //print(jsonResult["results"][0]["question"]);
//     return jsonResult;
//   }catch(e)
//   {
//     print(e);
//   }
// }