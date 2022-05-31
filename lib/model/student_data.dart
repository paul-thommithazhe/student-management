import 'package:hive/hive.dart';
part 'student_data.g.dart';

@HiveType(typeId: 0)
class StudentData {
  StudentData({
    required this.name,
    required this.age,
    required this.place,
    required this.imagePath,
  });

  @HiveField(0)
  String name;
  @HiveField(1)
  String age;
  @HiveField(2)
  String place;
  @HiveField(3)
  String imagePath;
}
