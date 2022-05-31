import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:student/core/colors.dart';
import 'package:student/model/student_data.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:student/views/home/main_home.dart';

late Box db;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDocumentDir.path);
  Hive.registerAdapter(StudentDataAdapter());
  db = await Hive.openBox<StudentData>('studentData');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        hintColor: kWhiteColor,
        backgroundColor: kBlackColor,
        appBarTheme: const AppBarTheme(color: kBlackColor),
        scaffoldBackgroundColor: kBlackColor,
        bottomSheetTheme: const BottomSheetThemeData(
            backgroundColor: kWhiteColor,
            modalBackgroundColor: Color.fromARGB(255, 60, 58, 58)),
        textTheme: const TextTheme(
          headline2: TextStyle(color: kWhiteColor),
          headline1: TextStyle(color: kWhiteColor),
        ),
      ),
      home: const ScreenMain(),
    );
  }
}
