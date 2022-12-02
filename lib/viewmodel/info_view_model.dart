import 'package:flutter/foundation.dart';
import 'package:provider_exam_app/data/model/app_model.dart';
import 'package:provider_exam_app/data/repositoreis/app_repository.dart';

class InfoViewModel extends ChangeNotifier{
  InfoViewModel({required MyRepository myRepository}) {
    _myRepository = myRepository;
  }
  late MyRepository _myRepository;

  bool isLoading = false;


  List? appModel;

  fetchAllInfo()async{
    notify(true);
    appModel = await _myRepository.getAllData();
    notify(false);
  }

  notify(bool v){
    isLoading = v;
    notifyListeners();
  }

}