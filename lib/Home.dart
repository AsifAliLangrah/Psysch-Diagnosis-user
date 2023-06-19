// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:psych_diagnosis/About.dart';
// import 'package:psych_diagnosis/Connect%20with%20Doctor.dart';
// import 'package:psych_diagnosis/Login.dart';
// import 'package:psych_diagnosis/Major%20Depressive%20order.dart';
// import 'package:psych_diagnosis/MyProfile.dart';
// import 'Help.dart';
//   class Home extends StatefulWidget {
//      late final String userName;
//     @override
//   State<Home> createState() => _HomeState();
//   }
//   class _HomeState extends State<Home> {
//   get userName => '';
//   void Logout() async {
//   }
//   GlobalKey<ScaffoldState> _scaffoldKEy = GlobalKey<ScaffoldState>();
//   String getGreetingMessage() {
//     final currentTime = DateTime.now();
//     final currentTimeOfDay = currentTime.hour;
//
//     if (currentTimeOfDay >= 0 && currentTimeOfDay < 12) {
//       return 'Good Morning';
//     } else if (currentTimeOfDay >= 12 && currentTimeOfDay < 17) {
//       return 'Good Afternoon';
//     } else {
//       return 'Good Evening';
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     final greetingMessage = getGreetingMessage();
//     return Scaffold(
//       key: _scaffoldKEy,
//       drawer: Drawer(
//         backgroundColor: Colors.white,
//         child: ListView(padding: EdgeInsets.zero, children: [
//           DrawerHeader(
//             padding: EdgeInsets.zero,
//             child: UserAccountsDrawerHeader(
//               decoration: BoxDecoration(
//                 color: Color(0xfff3F48CC),
//                 image: DecorationImage(
//                     image: AssetImage(
//                       "",
//                     ),
//                     alignment: Alignment.topRight),
//               ),
//               margin: EdgeInsets.zero,
//               currentAccountPicture: CircleAvatar(
//                 backgroundImage: AssetImage("assets/images/Asif.jpeg"),
//               ),
//               accountName: Text(
//                 "Asif Raza",
//                 style: TextStyle(color: Colors.black),
//               ),
//               accountEmail: Text(
//                 "asifaliraza452gmail.com",
//                 style: TextStyle(color: Colors.black),
//               ),
//             ),
//           ),
//           ListTile(
//             onTap: () {
//               Navigator.push(context, MaterialPageRoute(builder: (_) {
//                 return Home();
//               }));
//             },
//             leading: IconButton(
//               icon: Image.asset("assets/images/home.png"),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (_) {
//                       return Home();
//                     },
//                   ),
//                 );
//               },
//             ),
//             title: Text(
//               "Home",
//               textScaleFactor: 1.2,
//             ),
//           ),
//           ListTile(
//             onTap: () {
//               Navigator.push(context, MaterialPageRoute(builder: (_) {
//                 return ConnectWithDoctor();
//               }));
//             },
//             leading: IconButton(
//               icon: Image.asset("assets/images/connect.png"),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (_) {
//                       return ConnectWithDoctor();
//                     },
//                   ),
//                 );
//               },
//             ),
//             title: Text(
//               "Connect with Doctor",
//               textScaleFactor: 1.2,
//             ),
//           ),
//           ListTile(
//             onTap: () {
//               Navigator.push(context, MaterialPageRoute(builder: (_) {
//                 return Help();
//               }));
//             },
//             leading: IconButton(
//               icon: Image.asset("assets/images/doctor.png"),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (_) {
//                       return Help();
//                     },
//                   ),
//                 );
//               },
//             ),
//             title: Text(
//               "I am a Mental Health professional"
//             ),
//           ),
//           ListTile(
//             onTap: () {
//               Navigator.push(context, MaterialPageRoute(builder: (_) {
//                 return About();
//               }));
//             },
//             leading: IconButton(
//               icon: Image.asset("assets/images/About.png"),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (_) {
//                       return About();
//                     },
//                   ),
//                 );
//               },
//             ),
//             title: Text(
//               "About us",
//               textScaleFactor: 1.2,
//             ),
//           ),
//           Divider(
//             thickness: 0.10,
//             color: Colors.black,
//           ),
//           ListTile(
//             onTap: () {
//               Navigator.push(context, MaterialPageRoute(builder: (_) {
//                 return Login();
//               }));
//             },
//             leading: IconButton(
//               icon: Image.asset("assets/images/Logout.png"),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (_) {
//                       return Login();
//                     },
//                   ),
//                 );
//               },
//             ),
//             title: Text(
//               "Logout",
//               textScaleFactor: 1.2,
//             ),
//           ),
//         ]),
//       ),
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.transparent,
//         leading: IconButton(
//           onPressed: () {
//             _scaffoldKEy.currentState?.openDrawer();
//           },
//           icon: Image.asset("assets/images/Drawer.png"),
//         ),
//         title: Text("Home",style: TextStyle(
//           fontSize: 22,
//           fontWeight: FontWeight.w700,
//           color: Color(0xff3F48CC),
//           fontFamily: "Aref Ruqaa"
//         ),),
//         actions: [
//         Row(
//           children: [
//             IconButton(onPressed: (){
//               Navigator.push(context, MaterialPageRoute(builder: (_)=>MyProfile()));
//             },
//                 icon: Icon(Icons.settings,color:Colors.blueAccent,))
//           ],
//         ),
//         ],
//       ),
//       body:  StreamBuilder(
//         stream: FirebaseFirestore.instance
//             .collection('user')
//         .where('userid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
//         .snapshots(),
//     builder: (context,
//     AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
//       if ( snapshot.hasError) {
//         return Text('Something went wrong');
//       }
//
//       if ( snapshot.connectionState == ConnectionState.waiting) {
//         return Align(
//           alignment: Alignment.center,
//           child: Container(
//             height: 30,
//             width: 30,
//             child: CircularProgressIndicator(),
//           ),
//         );
//       }
//     final userData = snapshot.data!.docs.first.data();
//        return ListView.builder(
//     scrollDirection: Axis.vertical,
//     itemCount: snapshot.data?.docs.length ?? 0,
//     shrinkWrap: true,
//     itemBuilder: (BuildContext context, int index) {
//     return SingleChildScrollView(
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Padding(
//         padding: EdgeInsets.only(left: 10),
//         child: Text(
//           '$greetingMessage, $userName',
//           style: TextStyle(fontSize: 20,
//           fontWeight: FontWeight.w600),
//         ),
//       ),
//     Padding(
//       padding: EdgeInsets.only(left: 10),
//       child: Text('${snapshot.data!.docs[index]['firstName'] + " " +
//       snapshot.data!.docs[index]['LastName']}',
//       style: TextStyle(
//       fontStyle: FontStyle.normal,
//       fontWeight: FontWeight.w600,
//       fontSize: 20,
//       color: Colors.black,
//       ),
//       ),
//     ),
//     // Row(
//     //   children: [
//     //     Padding(padding: EdgeInsets.only(left: 15)),
//     //     Text("AlexJack",style: TextStyle(
//     //       fontSize: 20,
//     //       fontWeight: FontWeight.w600,
//     //     ),
//     //     ),
//     //   ],
//     // ),
//     GestureDetector(
//     onTap: () {
//     Navigator.push(context, MaterialPageRoute(builder: (_) {
//     return MajorDepressiveOrder();
//     }));
//     },
//     child: Container(
//     height: 500,
//     child: ListView.builder(
//     itemCount: 15,
//     itemBuilder: (BuildContext context, int index) {
//     return Padding(
//     padding: const EdgeInsets.only(
//     left: 20, right: 20, top: 20),
//     child: Container(
//     width: 345,
//     height: 60,
//     decoration: BoxDecoration(
//     borderRadius: BorderRadius.circular(4),
//     color: Colors.white,
//     boxShadow: [BoxShadow(
//     color: Colors.black,
//     blurRadius: 1
//     )
//     ]
//     ),
//     child: Row(
//     children: [
//     Padding(padding: EdgeInsets.only(left: 5)),
//     Padding(
//     padding: const EdgeInsets.only(
//     left: 10, top: 15),
//     child: Column(
//     mainAxisAlignment: MainAxisAlignment.start,
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//     Text(
//     "Section 1",
//     style: TextStyle(
//     fontSize: 16,
//     fontWeight: FontWeight.w600,
//     color: Colors.black,
//     ),
//     ),
//     ],
//     ),
//     ),
//     Padding(padding: EdgeInsets.only(
//     left: 12,
//     )),
//     Text("(28 Question)")
//     ],
//     ),
//     ),
//     );
//     }),
//     ),
//     ),
//     Divider(
//     thickness: 5,
//     ),
//     ListTile(
//     leading: CircleAvatar(
//     backgroundImage: AssetImage("assets/images/asif.jpg"),
//     ),
//     title: Text("Cynthia Flores M.D.", style: TextStyle(
//     fontWeight: FontWeight.w600,
//     fontSize: 20
//     ),
//     ),
//     ),
//     GestureDetector(
//     onTap: () {
//     Navigator.push(context, MaterialPageRoute(builder: (_) {
//     return MajorDepressiveOrder();
//     }));
//     },
//     child: Container(
//     height: 700,
//     child: ListView.builder(
//     itemCount: 15,
//     itemBuilder: (BuildContext context, int index) {
//     return Padding(
//     padding: const EdgeInsets.only(
//     left: 20, right: 20, top: 20),
//     child: Container(
//     width: 345,
//     height: 60,
//     decoration: BoxDecoration(
//     borderRadius: BorderRadius.circular(4),
//     color: Colors.white,
//     boxShadow: [BoxShadow(
//     color: Colors.black,
//     blurRadius: 1
//     )
//     ]
//     ),
//     child: Row(
//     children: [
//     Padding(padding: EdgeInsets.only(left: 5)),
//     Padding(
//     padding: const EdgeInsets.only(
//     left: 10, top: 15),
//     child: Column(
//     mainAxisAlignment: MainAxisAlignment.start,
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//     Text(
//     "Section 1",
//     style: TextStyle(
//     fontSize: 16,
//     fontWeight: FontWeight.w600,
//     color: Colors.black,
//     ),
//     ),
//     ],
//     ),
//     ),
//     Padding(padding: EdgeInsets.only(
//     left: 12,
//     )
//     ),
//     Text("(28 Question)")
//     ],
//     ),
//     ),
//     );
//     }
//     ),
//     ),
//     ),
//     ],
//     ),
//     );
//     }
//     );
//     }
//       )
//     );
//   }
//  }
//
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:psych_diagnosis/Connect with Doctor.dart';
import 'About.dart';
import 'Login.dart';
import 'MyProfile.dart';
import 'colors.dart';
import 'layout_home.dart';

class PsychHome extends StatefulWidget {
  @override
  _PsychHomeState createState() => _PsychHomeState();
}

class _PsychHomeState extends State<PsychHome> {
  String greetingMessage = '';
  String currentUserName = '';
  String currentUserEmail = '';
  String currentUserProfile = '';

  @override
  void initState() {
    super.initState();
    setGreetingMessage();
    getCurrentUserDetails();
  }

  void setGreetingMessage() {
    final currentTime = TimeOfDay.now();
    if (currentTime.hour < 12) {
      setState(() {
        greetingMessage = 'Good Morning';
      });
    } else if (currentTime.hour < 17) {
      setState(() {
        greetingMessage = 'Good Afternoon';
      });
    } else {
      setState(() {
        greetingMessage = 'Good Evening';
      });
    }
  }

  Future<void> getCurrentUserDetails() async {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    final userDoc = await FirebaseFirestore.instance
        .collection('user')
        .doc(userId)
        .get();

    if (userDoc.exists) {
      setState(() {
        currentUserName =
        '${userDoc.get('firstName')} ${userDoc.get('LastName')}';
        currentUserEmail = userDoc.get('email');
        currentUserProfile = userDoc.get('profile');
      });
    }
  }

  Future<void> updateCurrentDate() async {
    await FirebaseFirestore.instance
        .collection('user')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({
      'currentDate': DateTime.now(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        title: Text(
          'Home',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: buttonColor,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                openScreen(
                  context,
                  ProfilePsychProfile(),
                );
              },
              child: Icon(
                Icons.settings,
                color: buttonColor,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              greetingMessage,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('user')
                .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                .snapshots(),
            builder: (context,
                AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              return snapshot.data?.size == 0
                  ? Center(
                child: Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Text(
                    currentUserName,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
              )
                  : ListView.builder(
                itemCount: snapshot.data?.docs.length ?? 0,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 10,
                  );
                },
              );
            },
          ),
          StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('disease')
                .orderBy('date', descending: false)
                .snapshots(),
            builder: (context,
                AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: Text("Data doesn't Exist"),
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    color: buttonColor,
                  ),
                );
              }
              return Expanded(
                child: snapshot.data?.size == 0
                    ? Center(
                  child: Text(
                    'No data Found',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                )
                    : ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.data?.docs.length ?? 0,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    final sectionCount = index + 1;
                    return LayoutPsychHome(
                      disease: snapshot.data?.docs[index]['disease'],
                      minimumYes: snapshot.data?.docs[index]['mini'],
                      diseaseId: snapshot.data?.docs[index]['uid'],
                      adminId: snapshot.data?.docs[index]['admin'],
                      sectionCount: sectionCount,
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Align(
                alignment: Alignment.center,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey.withOpacity(0.30),
                    radius: 30,
                    backgroundImage: NetworkImage(currentUserProfile),
                  ),
                  title: Text(
                    currentUserName,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  subtitle: Text(
                    currentUserEmail,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: buttonColor,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: buttonColor,
                size: 24,
              ),
              title: Text(
                'Home',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: Icon(
                Icons.contact_mail,
                color: buttonColor,
                size: 24,
              ),
              title: Text(
                'Connect with Doctor',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
                openScreen(context,ConnectToDoctor ());
              },
            ),
            ListTile(
              leading: Icon(
                Icons.person,
                color: buttonColor,
                size: 24,
              ),
              title: Text(
                'My Profile',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
                openScreen(context, ProfilePsychProfile());
              },
            ),

            ListTile(
              leading: Icon(
                Icons.info,
                color: buttonColor,
                size: 24,
              ),
              title: Text(
                'About Us',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
                openScreen(context, About());
              },
            ),
            Divider(
              thickness: 0.5,
              color: Colors.black,
            ),
            ListTile(
              leading: Icon(
                Icons.logout,
                color: buttonColor,
                size: 24,
              ),
              title: Text(
                'Logout',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              onTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (BuildContext context) => Login(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
void openScreen(BuildContext context, Widget widget) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (BuildContext context) => widget,
    ),
  );
}
void main() {
  runApp(MaterialApp(
    home: PsychHome(),
    debugShowCheckedModeBanner: false,
  )
  );
}
