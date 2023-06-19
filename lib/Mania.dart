import 'package:flutter/material.dart';

class Mania extends StatefulWidget {
  const Mania({Key? key}) : super(key: key);

  @override
  State<Mania> createState() => _ManiaState();
}

class _ManiaState extends State<Mania> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.black,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text("section 3",style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),),
      ),
    );
  }
}
