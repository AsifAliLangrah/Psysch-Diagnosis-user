import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:psych_diagnosis/splash.dart';
import 'package:firebase_core/firebase_core.dart';
 Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // FirebaseFirestore _firestore =  FirebaseFirestore.instance;
 // DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection
 //   ('users').doc("auN5PkUh85a4PJXgoG4c ").get();
 //  print (snapshot.data().toString());
 // for(var doc in snapshot.docs ){
 //   print(doc.data().toString() );
 // }
 //  Map<String, dynamic > newUserData = {
 // "name":"asif ",
 //    "email":"asif1@gmail.com"
 //  };
 //  await _firestore.collection("users").add(newUserData);
 //  print("New user saved");
  // Map<String, dynamic > newUserData = {
  //   "name":"asif ",
  //   "email":"asif1@gmail.com"
  // };
  // await _firestore.collection("users").doc("your id here ").update({
  //   "email": "asif2@gmail.com",
  // });
  // print("User updated!");
  // await _firestore.collection("users").doc("7AyQuGHximFjp5C34JnE").delete();
  // print("user Deleted!");
  runApp(MyApp());
 }
  class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: (FirebaseAuth.instance.currentUser !=null) ? splash() :  splash()
    );
  }
 }