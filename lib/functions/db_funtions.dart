import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hive/hive.dart';
import 'package:student/main.dart';
import 'package:student/model/student_data.dart';

ValueNotifier<List<StudentData>> studentList = ValueNotifier([]);

Future<void> addStudent(StudentData value) async {
  final studentDb = await Hive.openBox<StudentData>('studentData');
  studentDb.add(value);

  studentList.value.add(value);
  studentList.notifyListeners();
}

Future getStudentDetails() async {
  studentList.value.clear();
  Box<StudentData> studentDb = Boxes.getInstance();

  print(studentDb.values);

  List<StudentData> students = studentDb.values.toList();

  for (var item in students) {
    print(item.name);
  }

  print('GETTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTt');

  studentList.value.addAll(studentDb.values);
  studentList.notifyListeners();
}

Future<void> deleteStudentData(int index) async {
  final studentDb = await Hive.openBox<StudentData>('studentData');
  await studentDb.deleteAt(index);
  getStudentDetails();
}

class StudentController extends GetxController {
  RxList studentDetails = [].obs;

  getStudentDetails() {
    Box box = Boxes.getInstance();
    studentDetails.value = box.values.toList() as List<StudentData>;
  }

  Future<void> addStudent(StudentData value) async {
    Box studentDb = Boxes.getInstance();
    studentDb.add(value);
    studentDetails.add(value);
    update();
  }

  Future<void> deleteStudentData(int index) async {
    Box studentDb = Boxes.getInstance();
    await studentDb.deleteAt(index);
    getStudentDetails();
    update();
  }

  @override
  void onInit() {
    getStudentDetails();
    // TODO: implement onInit
    super.onInit();
  }
}

class Boxes {
  static getInstance() {
    Box<StudentData> box = Hive.box<StudentData>('studentData');
    return box;
  }
}
