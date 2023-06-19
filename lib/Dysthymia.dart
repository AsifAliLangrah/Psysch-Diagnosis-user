import 'package:flutter/material.dart';

class Dysthymia extends StatefulWidget {
  const Dysthymia({Key? key}) : super(key: key);

  @override
  State<Dysthymia> createState() => _DysthymiaState();
}

class _DysthymiaState extends State<Dysthymia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.black),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text("Section 2",style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),),
      ),
    );
  }
}
