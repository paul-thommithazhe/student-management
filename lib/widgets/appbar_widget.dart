import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  AppBarWidget({Key? key, required this.title}) : super(key: key);
  String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
    );
  }
}
