
import 'package:http/http.dart' as http;
import 'dart:convert';

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