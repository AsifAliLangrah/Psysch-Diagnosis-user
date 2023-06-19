// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'HelpChat.dart';
// class Help extends StatefulWidget {
//   const Help({Key? key}) : super(key: key);
//
//   @override
//   State<Help> createState() => _HelpState();
// }
// class _HelpState extends State<Help> {
//   late final String url;
//   late final User user;
//   User? selectedUser; // Variable to store the selected user
//   late List<User> users; // List to store the users
//
//   @override
//   void initState() {
//     super.initState();
//     fetchUsers();
//   }
//
//   void fetchUsers() {
//     // Fetch the users from Firebase Firestore
//     FirebaseFirestore.instance
//         .collection('admin')
//         .get()
//         .then((QuerySnapshot querySnapshot) {
//       setState(() {
//         users = querySnapshot.docs.map((doc) {
//           return User(
//             uid: doc.id,
//             name: doc['firstName'],
//             email: doc['email'],
//             // Add more properties if needed
//           );
//         }).toList();
//       });
//     }).catchError((error) {
//       // Handle the error
//       print(error);
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.transparent,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back_ios, color: Colors.black),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         title: Text(
//           "Help",
//           style: TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.w600,
//             color: Colors.black,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(
//               padding: EdgeInsets.only(left: 15, top: 20),
//               child: Container(
//                 height: 395,
//                 width: 345,
//                 color: Colors.white,
//                 child: Column(
//                   children: [
//                     Text(
//                       'Help',
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Container(
//                         child: InputDecorator(
//                           decoration: InputDecoration(
//                             fillColor: Colors.grey.shade100,
//                             filled: true,
//                             hintText: "Select Doctor",
//                             border: OutlineInputBorder(
//                               borderSide: BorderSide(width: 1),
//                             ),
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide(width: 1),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(width: 1),
//                             ),
//                           ),
//                           child: DropdownButtonHideUnderline(
//                             child: DropdownButton<User>(
//                               value: selectedUser,
//                               onChanged: (user) {
//                                 setState(() {
//                                   selectedUser = user;
//                                 });
//                               },
//                               items: users.map((user) {
//                                 return DropdownMenuItem<User>(
//                                   value: user,
//                                   child: Text(user.name),
//                                 );
//                               }).toList(),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Container(
//                         child: TextField(
//                           decoration: InputDecoration(
//                             fillColor: Colors.grey.shade100,
//                             filled: true,
//                             hintText: "Enter issue Tile",
//                             border: OutlineInputBorder(
//                               borderSide: BorderSide(width: 1),
//                             ),
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide(width: 1),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(width: 1),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Container(
//                         child: TextField(
//                           decoration: InputDecoration(
//                             fillColor: Colors.grey.shade100,
//                             filled: true,
//                             hintText: "Question Text Here",
//                             border: OutlineInputBorder(
//                               borderSide: BorderSide(width: 1),
//                             ),
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide(width: 1),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(width: 1),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 30,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         TextButton(
//                           style: TextButton.styleFrom(
//                             backgroundColor: Color(0xff3F48CC),
//                             minimumSize: Size(140, 40),
//                           ),
//                           onPressed: () {
//                            if (selectedUser != null) {
//                           Navigator.push(context, MaterialPageRoute(builder: (_) {
//                              return ChatPage(
//                          url: '', name: '', uid: '', email: '', providerId: null, text: null, profile: null,
//                          );
//                          }));
//                            }
//                              },
//                            child: Text(
//                             "Send",
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 18,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class User {
//   final String uid;
//   final String name;
//   final String email;
//
//   User({required this.uid, required this.name, required this.email});
// }
//
//
//
//
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/material.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:psych_diagnosis/Help1.dart';
// // import 'colors.dart';
// //
// // class ExamplePage extends StatefulWidget {
// //   @override
// //   State<ExamplePage> createState() => _ExamplePageState();
// // }
// //
// // class _ExamplePageState extends State<ExamplePage> {
// //   var emailController = TextEditingController();
// //
// //   var feedController = TextEditingController();
// //   String? selectedUser;
// //   String? selectedUserId;
// //   String? selectedUserImage;
// //
// //   Future<void> help() async {
// //     if (selectedUser == null) {
// //       print('Please select a user');
// //       return;
// //     }
// //     if (emailController.text.isEmpty) {
// //       print('Please Enter Your Disease');
// //     } else if (feedController.text.isEmpty) {
// //       print('Please Enter Your Feedback');
// //     } else {
// //       CollectionReference products =
// //       FirebaseFirestore.instance.collection('help');
// //       products.doc().set({
// //         'issueTitle': emailController.text,
// //         'disc': feedController.text,
// //         'doctorImage': selectedUserImage,
// //         'doctorName': selectedUser,
// //         'doctorId': selectedUserId,
// //         'userId': FirebaseAuth.instance.currentUser!.uid,
// //       });
// //       print('Feedback Successfully Sent');
// //       openScreen(context, ScreenHelp());
// //       return print('hello');
// //     }
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         backgroundColor: Colors.white,
// //         elevation: 1,
// //         centerTitle: true,
// //         title: Text(
// //           'Help',
// //           style: appbarStyle,
// //         ),
// //         leading: IconButton(
// //           onPressed: () {
// //             Navigator.pop(context);
// //           },
// //           icon: Icon(
// //             Icons.arrow_back_ios,
// //             color: Colors.black,
// //           ),
// //         ),
// //       ),
// //       body: Center(
// //         child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
// //           stream: FirebaseFirestore.instance
// //               .collection('admin')
// //               .where('connected', isEqualTo: true)
// //               .snapshots(),
// //           builder: (BuildContext context,
// //               AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
// //             if (snapshot.hasError) {
// //               return Text('Error: ${snapshot.error}');
// //             }
// //             if (snapshot.connectionState == ConnectionState.waiting) {
// //               return CircularProgressIndicator(
// //                 color: buttonColor,
// //               );
// //             }
// //
// //             // Extract a list of users from the QuerySnapshot
// //             List<DropdownMenuItem<String>> items =
// //             snapshot.data!.docs.map((doc) {
// //               String fullName = doc['firstName'] + ' ' + doc['LastName'];
// //               String userId = doc['adminId'];
// //               String userImage = doc['profile'];
// //               return DropdownMenuItem<String>(
// //                 value: fullName,
// //                 child: Text(fullName),
// //               );
// //             }).toList();
// //
// //             // Create a DropdownButtonFormField with the list of strings
// //             return Column(
// //               children: [
// //                 Container(
// //                   margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
// //                   child: DropdownButtonFormField<String>(
// //                     decoration: InputDecoration(
// //                       focusedBorder: OutlineInputBorder(
// //                         borderSide: BorderSide(color: buttonColor),
// //                       ),
// //                       hintText: 'Select Doctor',
// //                       hintStyle: textFieldStyle,
// //                       border: OutlineInputBorder(
// //                         borderSide: BorderSide(color: Colors.black),
// //                       ),
// //                     ),
// //                     value: selectedUser,
// //                     items: items,
// //                     onChanged: (String? value) {
// //                       // Do something when the dropdown value changes
// //                       if (value != null) {
// //                         setState(() {
// //                           selectedUser = value;
// //                           selectedUserId = snapshot.data!.docs[items.indexWhere(
// //                                   (item) => item.value == value)]['adminId'];
// //                           selectedUserImage = snapshot.data!.docs[items
// //                               .indexWhere((item) => item.value == value)]
// //                           ['profile'];
// //                         });
// //                       }
// //                     },
// //                   ),
// //                 ),
// //                 Container(
// //                   // height: 43,
// //                   // height: MediaQuery.of(context).size.height/9,
// //                   width: MediaQuery.of(context).size.width * 0.90,
// //                   margin: EdgeInsets.all(10),
// //                   child: TextField(
// //                     cursorColor: buttonColor,
// //                     controller: emailController,
// //                     decoration: InputDecoration(
// //                       focusedBorder: OutlineInputBorder(
// //                         borderSide: BorderSide(
// //                           color: buttonColor,
// //                         ),
// //                       ),
// //                       border: OutlineInputBorder(),
// //                       hintText: "Enter Issue Tile",
// //                       hintStyle: textFieldStyle,
// //                     ),
// //                   ),
// //                 ),
// //                 Container(
// //                   width: MediaQuery.of(context).size.width * 0.90,
// //                   margin: EdgeInsets.all(10),
// //                   child: TextField(
// //                     cursorColor: buttonColor,
// //                     controller: feedController,
// //                     maxLines: 5,
// //                     decoration: InputDecoration(
// //                       focusedBorder: OutlineInputBorder(
// //                         borderSide: BorderSide(
// //                           color: buttonColor,
// //                         ),
// //                       ),
// //                       border: OutlineInputBorder(),
// //                       hintText: "Question Text here",
// //                       hintStyle: textFieldStyle,
// //                     ),
// //                   ),
// //                 ),
// //                 TextButton(
// //                   style: TextButton.styleFrom(
// //                     minimumSize: Size(174, 32),
// //                     shape: RoundedRectangleBorder(
// //                       borderRadius: BorderRadius.circular(10),
// //                     ),
// //                     backgroundColor: buttonColor,
// //                   ),
// //                   onPressed: () => help(),
// //                   child: Text(
// //                     'Send',
// //                     style: buttonText,
// //                   ),
// //                 ),
// //               ],
// //             );
// //           },
// //         ),
// //       ),
// //     );
// //   }
// // }
