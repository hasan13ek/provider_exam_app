import 'package:flutter/material.dart';
import 'package:provider_exam_app/data/api_servic/api_servic.dart';
import 'package:provider_exam_app/data/model/app_model.dart';
import 'package:provider_exam_app/data/repositoreis/app_repository.dart';
import 'package:provider_exam_app/ui/screens/info_screen.dart';
import 'package:provider/provider.dart';
import 'package:provider_exam_app/viewmodel/info_view_model.dart';

void main() {
  MyRepository myRepository = MyRepository(apiservic: Apiservic());
  InfoViewModel infoViewModel = InfoViewModel(myRepository: myRepository);
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_)=>infoViewModel)
        ],
        child: MyApp(),
      ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: InfoScreen(),
    );
  }
}

