import 'package:provider_exam_app/data/api_servic/api_servic.dart';
import 'package:provider_exam_app/data/model/app_model.dart';

class MyRepository{
  MyRepository({required Apiservic apiservic}){
    _apiservic = apiservic;
  }
  late Apiservic _apiservic;

  Future<List<AppModel>> getAllData()=>_apiservic.getData();
}