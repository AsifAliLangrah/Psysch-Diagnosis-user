// import 'package:flutter/material.dart';
// import 'package:psych_diagnosis/HelpChat.dart';
// import 'dart:io';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// class Help1 extends StatefulWidget {
//   const Help1({Key? key}) : super(key: key);
//
//   @override
//   State<Help1> createState() => _Help1State();
// }
//
// class _Help1State extends State<Help1> {
//   String name = 'Name Loading';
//   TextEditingController _searchController = TextEditingController();
//   List<QueryDocumentSnapshot> searchResults = [];
//   List<QueryDocumentSnapshot> allUsers = [];
//   bool isSearching = false;
//
//   void getData() async {
//     User? user = await FirebaseAuth.instance.currentUser;
//     var vari = await FirebaseFirestore.instance.collection('admin').doc(user?.uid).get();
//     setState(() {
//       name = vari.data()?['Name'];
//     });
//   }
//
//   @override
//   void initState() {
//     getData();
//     super.initState();
//     fetchAllUsers();
//   }
//
//   void fetchAllUsers() async {
//     QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('admin').get();
//
//     setState(() {
//       allUsers = snapshot.docs;
//     });
//   }
//
//   void performSearch(String query) async {
//     QuerySnapshot snapshot = await FirebaseFirestore.instance
//         .collection('admin')
//         .orderBy('firstName')
//         .startAt([query])
//         .endAt([query + '\uf8ff'])
//         .get();
//
//     setState(() {
//       searchResults = snapshot.docs;
//     });
//   }
//
//   void clearSearch() {
//     setState(() {
//       _searchController.clear();
//       searchResults = [];
//       isSearching = false;
//     });
//   }
//
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
//         actions: [
//           IconButton(
//             icon: Icon(Icons.search, color: Colors.black),
//             onPressed: () {
//               setState(() {
//                 isSearching = true;
//               });
//             },
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             if (isSearching)
//               Container(
//                 padding: EdgeInsets.all(10),
//                 child: TextField(
//                   controller: _searchController,
//                   decoration: InputDecoration(
//                     hintText: 'Search',
//                     prefixIcon: IconButton(
//                       icon: Icon(Icons.arrow_back, color: Colors.grey),
//                       onPressed: clearSearch,
//                     ),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                   onChanged: (value) {
//                     if (value.isNotEmpty) {
//                       performSearch(value);
//                     } else {
//                       setState(() {
//                         searchResults = [];
//                       });
//                     }
//                   },
//                 ),
//               ),
//             if (searchResults.isNotEmpty)
//               Container(
//                 height: 700,
//                 child: ListView.builder(
//                   itemCount: searchResults.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     var data = searchResults[index].data() as Map<String, dynamic>;
//                     var firstName = data['firstName'] ?? '';
//                     var lastName = data['lastName'] ?? '';
//                     var profile = data['profile'] ?? '';
//                     var email = data['email'] ?? '';
//                     var userId = data['userid'] ?? '';
//
//                     return Column(
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (_) => ChatPage(
//                                   uid: userId,
//                                   url: profile,
//                                   name: '$firstName $lastName',
//                                   email: email, text: '', profile: '', providerId: '',
//                                 ),
//                               ),
//                             );
//                           },
//                           child: ListTile(
//                             leading: CircleAvatar(
//                               backgroundImage: NetworkImage(profile),
//                             ),
//                             title: Text("Issues Title"),
//                             subtitle: Text(
//                               '$firstName $lastName',
//                               style: TextStyle(
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                             trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
//                           ),
//                         ),
//                         Divider(
//                           thickness: 0.5,
//                           color: Colors.black,
//                         ),
//                       ],
//                     );
//                   },
//                 ),
//               )
//             else if (allUsers.isNotEmpty)
//               Container(
//                 height: 700,
//                 child: ListView.builder(
//                   itemCount: allUsers.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     var data = allUsers[index].data() as Map<String, dynamic>;
//                     var firstName = data['firstName'] ?? '';
//                     var lastName = data['lastName'] ?? '';
//                     var profile = data['profile'] ?? '';
//                     var email = data['email'] ?? '';
//                     var userId = data['userid'] ?? '';
//
//                     return Column(
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (_) => ChatPage(
//                                   uid: userId,
//                                   url: profile,
//                                   name: '$firstName $lastName',
//                                   email: email, providerId: '', text: '', profile: '',
//                                 ),
//                               ),
//                             );
//                           },
//                           child: ListTile(
//                             leading: CircleAvatar(
//                               backgroundImage: NetworkImage(profile),
//                             ),
//                             title: Text("Issues Title"),
//                             subtitle: Text(
//                               '$firstName $lastName',
//                               style: TextStyle(
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                             trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
//                           ),
//                         ),
//                         Divider(
//                           thickness: 0.5,
//                           color: Colors.black,
//                         ),
//                       ],
//                     );
//                   },
//                 ),
//               )
//             else
//               Text('No users available.'),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
//
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:flutter/material.dart';
// // import 'package:psych_diagnosis/HelpChat.dart';
// // import 'Help.dart';
// // import 'colors.dart';
// //
// // class ScreenHelp extends StatefulWidget {
// //   @override
// //   State<ScreenHelp> createState() => _ScreenHelpState();
// // }
// //
// // class _ScreenHelpState extends State<ScreenHelp> {
// //   var user;
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.white,
// //       appBar: AppBar(
// //         backgroundColor: Colors.white,
// //         elevation: 1,
// //         centerTitle: true,
// //         title: Text(
// //           'Help',
// //           style: appbarStyle,
// //         ),
// //         actions: [
// //           Icon(
// //             Icons.search,
// //             color: Colors.black,
// //           ),
// //           SizedBox(
// //             width: 10,
// //           ),
// //         ],
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
// //       body: StreamBuilder<QuerySnapshot>(
// //           stream: FirebaseFirestore.instance.collection('help').snapshots(),
// //           builder: (context, snapshot) {
// //             if (!snapshot.hasData) {
// //               return Center(
// //                 child: Text("Data doesn't exist"),
// //               );
// //             }
// //             if (snapshot.connectionState == ConnectionState.waiting) {
// //               return Center(
// //                 child: CircularProgressIndicator(
// //                   color: buttonColor,
// //                 ),
// //               );
// //             }
// //             return ListView.builder(
// //               shrinkWrap: true,
// //               itemCount: snapshot.data?.docs.length ?? 0,
// //               itemBuilder: (BuildContext context, int index) {
// //                 return Column(
// //                   children: [
// //                     ListTile(
// //                       leading: CircleAvatar(
// //                         backgroundColor: buttonColor.withOpacity(0.40),
// //                         radius: 30,
// //                         backgroundImage: NetworkImage(
// //                           snapshot.data?.docs[index]['doctorImage'],
// //                         ),
// //                       ),
// //                       title: Text(
// //                         snapshot.data?.docs[index]['issueTitle'],
// //                         style: TextStyle(
// //                           fontSize: 15,
// //                           fontWeight: FontWeight.w500,
// //                           color: Colors.black,
// //                         ),
// //                       ),
// //                       subtitle: Text(
// //                         snapshot.data?.docs[index]['doctorName'],
// //                         style: TextStyle(
// //                           fontSize: 12,
// //                           fontWeight: FontWeight.w400,
// //                           color: Color(0xff777777),
// //                         ),
// //                       ),
// //                       trailing: Icon(
// //                         Icons.arrow_forward_ios,
// //                         color: Colors.black,
// //                       ),
// //                       onTap: () {
// //                         openScreen(
// //                           context,
// //                           ChatPage(
// //                             providerId: snapshot.data?.docs[index]['doctorId'],
// //                             profile: snapshot.data?.docs[index]['doctorImage'],
// //                             name: snapshot.data?.docs[index]['doctorName'],
// //                             text: snapshot.data?.docs[index]['issueTitle'], url: '', uid: '', email: '',
// //                           ),
// //                         );
// //                       },
// //                     ),
// //                     Divider(
// //                       color: Colors.black,
// //                       endIndent: 0,
// //                       indent: 0,
// //                     ),
// //                   ],
// //                 );
// //               },
// //             );
// //           }),
// //       floatingActionButton: FloatingActionButton(
// //         backgroundColor: buttonColor,
// //         onPressed: () {
// //           openScreen(context, Help());
// //         },
// //         child: Image.asset(
// //           'assets/images/img_7.png',
// //           height: 36,
// //           width: 36,
// //         ),
// //       ),
// //     );
// //   }
// // }
