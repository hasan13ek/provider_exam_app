import 'dart:convert';
import 'package:provider_exam_app/data/model/app_model.dart';
import 'package:http/http.dart' as http;

class Apiservic{
  Future<List<AppModel>> getData() async{
    String url = "https://banking-api.free.mockoapp.net/user_cards";

    var response = await http.get(Uri.parse(url));

    if(response.statusCode==200){
      List json = jsonDecode(response.body) as List;
      List<AppModel> appmodel = json.map((e) => AppModel.fromJson(e)).toList();
      return appmodel;
    }
    return List.empty();
  }
}

