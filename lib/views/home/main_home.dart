import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student/core/colors.dart';
import 'package:student/functions/db_funtions.dart';
import 'package:student/model/student_data.dart';
import 'package:student/views/home/widgets/bottom_sheet.dart';
import '../detailedPage/screen_detailed.dart';

class ScreenMain extends StatelessWidget {
  const ScreenMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getStudentDetails();

    final controller = Get.put(StudentController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Management System'),
      ),
      body: Obx(
        // init: StudentController(),
        () {
          print('helo');
          print(controller.studentDetails.value.length);
          return controller.studentDetails.value.isEmpty
              ? const Center(
                  child: Text(
                    'No Data',
                    style: TextStyle(color: kWhiteColor),
                  ),
                )
              : ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
                  itemBuilder: (context, index) {
                    StudentData data = controller.studentDetails.value[index];

                    File imageFile = File(data.imagePath);

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 105, 102, 102),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        height: 90,
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ScreenDetailed(index: 1),
                              ),
                            );
                          },
                          leading: Container(
                            width: 30,
                            height: 30,
                            color: Colors.red,
                            child: Image.file(imageFile),
                          ),
                          title: Text(data.name),
                          subtitle: Text(data.age),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () {
                                  addStudentDetails(context);
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Color.fromARGB(255, 158, 47, 39),
                                  size: 26,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  controller.deleteStudentData(index);
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Color.fromARGB(255, 158, 47, 39),
                                  size: 26,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: controller.studentDetails.value.length,
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addStudentDetails(context);
        },
        child: const Icon(Icons.add),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        backgroundColor: Colors.orange,
      ),
    );
  }

  addStudentDetails(context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => AddData(),
    );
  }
}
