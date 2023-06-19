import 'package:flutter/material.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);
  @override
  State<About> createState() => _AboutState();
}
class _AboutState extends State<About> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("About",style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.black
        ),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Image.asset("assets/images/Logo.png",
              height: 172,
              width: 190,),
            ),
            Container(
              height: 62,
              width: 318,
              child: Center(child: Text("    An application created by Michael O.Ortiz\nPMHNP-BC to support individuals in monitoring\ntheir symptoms in relation to their mental health.")),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  Text("Contact us",style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              leading: Image.asset("assets/images/web.png"),
              title: Text("www.psychdiagnosis.com"),
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              leading: Image.asset("assets/images/Mail.png"),
              title: Text("Psychdiagnosis@gmail.com"),
            ),
            SizedBox(
              height: 40,
            ),
            Center(
              child: Text("Version 6.13.1"),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text("Logged in as example123@gmail.com"),
            ),
          ],
        ),
      ),
    );
  }
}
