// import 'package:get/get.dart';
// import 'package:hive/hive.dart';
// import 'package:student/model/student_data.dart';

// class DataController extends GetxController {
//  final  List<StudentData> _studentData = [];
//   late Box<StudentData> boxes;

//   DataController() {
//     _studentData ;
//     boxes = Hive.box<StudentData>('studentData');

//     //initialize box from hive db

//     for (int i = 0; i < boxes.values.length; i++) {
//       _studentData.add(boxes.getAt(i));
//     }
//   }

//   addData(StudentData data) async {
//     final student_db = await Hive.openBox<StudentData>('studentData');

//     student_db.add(data);
//     update();
//   }

  
// }
