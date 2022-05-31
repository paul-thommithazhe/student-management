import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student/core/colors.dart';
import 'package:student/core/constants.dart';
import 'package:student/functions/db_funtions.dart';
import 'package:student/model/student_data.dart';
import 'package:student/views/home/main_home.dart';

class AddData extends StatefulWidget {
  AddData({Key? key}) : super(key: key);

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController placeController = TextEditingController();

  final TextEditingController ageController = TextEditingController();

  String imagePath = '';

  @override
  Widget build(BuildContext context) {
    print(imagePath);
    print(
        '================================================================================================');
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              children: [
                kHeight20,
                GestureDetector(
                  onTap: () {
                    getImageFromGallery();
                  },
                  child: imagePath != null
                      ? const Text('image uploaded')
                      : Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Icon(
                            Icons.upload,
                            color: kWhiteColor,
                          ),
                        ),
                ),
                kHeight20,
                TextFormField(
                  style: const TextStyle(color: kWhiteColor),
                  controller: nameController,
                  decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.grey),
                      hintText: 'Name',
                      border: OutlineInputBorder()),
                  autofocus: true,
                ),
                kHeight20,
                TextFormField(
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: kWhiteColor),
                  controller: ageController,
                  decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.grey),
                      hintText: 'Age',
                      border: OutlineInputBorder()),
                  autofocus: true,
                ),
                kHeight20,
                TextFormField(
                  style: TextStyle(color: kWhiteColor),
                  controller: placeController,
                  decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.grey),
                      hintText: 'Place',
                      border: OutlineInputBorder()),
                  autofocus: true,
                ),
                kHeight,
                GetBuilder<StudentController>(builder: (controller) {
                  return ElevatedButton(
                      onPressed: () {
                        controller.addStudent(
                          StudentData(
                              name: nameController.text,
                              age: ageController.text,
                              place: placeController.text,
                              imagePath: imagePath),
                        );
                        Get.back();
                      },
                      child: Text('Add Data'));
                })
              ],
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  getImageFromGallery() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      imagePath = imageTemp.path;
    } catch (e) {
      print('failed to pick image $e');
    }
  }
}
