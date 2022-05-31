import 'package:flutter/material.dart';

class ScreenDetailed extends StatelessWidget {
  ScreenDetailed({Key? key, required this.index}) : super(key: key);
  int index;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detailed Page'),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(10),
          width: double.infinity,
          height: 500,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                    color: Colors.grey,
                    offset: Offset.zero,
                    blurRadius: 10.0,
                    spreadRadius: 0.0,
                    blurStyle: BlurStyle.outer)
              ]),
          child: Center(
            child: Text('$index'),
          ),
        ),
      ),
    );
  }
}
