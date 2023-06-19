// import 'dart:io';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:psych_diagnosis/Login.dart';
// import 'package:psych_diagnosis/chateHelp.dart';
// import 'About.dart';
// import 'ChangePassword.dart';
// import 'Edit Profile.dart';
// import 'Help.dart';
// import 'Help1.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage ;
// class MyProfile extends StatefulWidget {
//   final  uid;
//   const MyProfile({Key? key, this.uid}) : super(key: key);
//   @override
//   State<MyProfile> createState() => _MyProfileState();
// }
// class _MyProfileState extends State<MyProfile> {
//   final Reference storageReference = FirebaseStorage.instance.ref().child('images/image1.jpg');
//   @override
//   void initState() {
//     FirebaseAuth auth = FirebaseAuth.instance;
//     final currentUser = auth.currentUser;
//     final myCollection = FirebaseFirestore.instance.collection('user');
//     final myQuery = myCollection.where('userid', isEqualTo: currentUser!.uid);
//     // TODO: implement initState
//     super.initState();
//     userDataModel userModel = userDataModel();
//     userModel.getMyData();
//   }
//   void Logout() async {
//  await FirebaseAuth.instance.signOut();
//  Navigator.popUntil(context, (route) => route.isFirst);
//  Navigator.pushReplacement(context, CupertinoPageRoute(builder:(context)=>Login()
//   ),
//   );
//   }
//   bool loading = false;
//   File? selectedImg;
//   final picker = ImagePicker();
//   var base64Img = "";
//   var _img;
//   String? imgUrl;
//   firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage
//       .instance;
//   @override
//   Widget build(BuildContext context){
//     return Scaffold(
//       body: StreamBuilder(
//         stream: FirebaseFirestore.instance
//             .collection('user')
//             .where('userid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
//             .snapshots(),
//         builder: (context,
//             AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
//           final userData = snapshot.data!.docs.first.data();
//           if ( snapshot.hasError) {
//             return Text('Something went wrong');
//           }
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Align(
//               alignment: Alignment.center,
//               child: Container(
//                 height: 30,
//                 width: 30,
//                 child: CircularProgressIndicator(
//                   color: Colors.black,
//                 ),
//               ),
//             );
//           }
//         //  final userData = snapshot.data!.docs.first.data();
//           return ListView.builder(
//             scrollDirection: Axis.vertical,
//               itemCount: snapshot.data?.docs.length ?? 0,
//               shrinkWrap: true,
//               itemBuilder: (BuildContext context, int index) {
//                 return  SingleChildScrollView(
//                   child: Column(
//                     children:[
//                       Stack(
//                   children:[
//                     Container(
//                       height: 360,
//                       width: MediaQuery.of(context).size.width,
//                       color: Color(0xff3F48CC),
//                     ),
//                     Positioned(
//                       top: 20,
//                       left: 0,
//                       right: 0,
//                       child: Align(
//                         alignment: Alignment.center,
//                         child: Text("Profile Setting",
//                           style: TextStyle(
//                             fontStyle: FontStyle.normal,
//                             fontWeight: FontWeight.w600,
//                             fontSize: 25,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       bottom: 0,
//                       child: Container(
//                         height: 200,
//                         width: MediaQuery.of(context).size.width,
//                         decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.only(
//                                 topRight: Radius.circular(160),
//                                 topLeft: Radius.circular(160)
//                             ),
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       left: 0,
//                       right: 0,
//                       bottom: 70,
//                       child: Column(children: [
//                         Align(
//                           alignment: Alignment.center,
//                           child: Container(
//                             height: 130,width: 130,
//                             child: CircleAvatar(
//                               radius: 50,
//                               backgroundImage: NetworkImage(userData['profile']),
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 10),
//                         Text('${snapshot.data!.docs[index]['firstName'] +" "+ snapshot.data!.docs[index]['LastName']}',
//                           style: TextStyle(
//                             fontStyle: FontStyle.normal,
//                             fontWeight: FontWeight.w600,
//                             fontSize: 22,
//                             color: Colors.black,
//                           ),
//                         ),
//                         SizedBox(height: 10),
//                         Text( '${snapshot.data!.docs[index]['email']}',
//                           style: TextStyle(
//                             fontStyle: FontStyle.normal,
//                             fontWeight: FontWeight.w400,
//                             fontSize: 14,
//                             color: Colors.black,
//                           ),
//                         ),
//                        ],
//                       ),
//                     ),
//                     Positioned(
//                       bottom: 0,
//                       child: Container(
//                         height: 40,
//                         width: 430,
//                         color: Color(0xffC4C4C4),
//                         child: Padding(
//                           padding: const EdgeInsets.only(left: 15),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               Text("Preferences",
//                                 style: TextStyle(
//                                   fontStyle: FontStyle.normal,
//                                   fontWeight: FontWeight.w600,
//                                   fontSize: 18,
//                                   color: Color(0xff7B8471),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     ]
//                    ),
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.push(context, MaterialPageRoute(builder: (_) {
//                             return EditProfile(uid: widget.uid);
//
//                           }));
//                         },
//                         child: ListTile(
//                           leading: Icon(Icons.person),
//                           title: Text("Edit Account",style: TextStyle(
//                             fontSize: 15,
//                             fontWeight: FontWeight.w600,
//                           ),
//                           ),
//                           trailing: Icon(Icons.arrow_forward_ios),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.push(context, MaterialPageRoute(builder: (_) {
//                             return ScreenHelp();
//                           }
//                           ));
//                         },
//                         child: ListTile(
//                           leading: Icon(Icons.help),
//                           title: Text("Help",style: TextStyle(
//                             fontSize: 15,
//                             fontWeight: FontWeight.w600,
//                           ),
//                           ),
//                           trailing:Icon(Icons.arrow_forward_ios),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.push(context, MaterialPageRoute(builder: (_) {
//                             return ChangePassword();
//                           }
//                           ));
//                         },
//                         child: ListTile(
//                           leading: Icon(Icons.password),
//                           title: Text("Change Password",style: TextStyle(
//                             fontSize: 15,
//                             fontWeight: FontWeight.w600,
//                           ),
//                           ),
//                           trailing: Icon(Icons.arrow_forward_ios),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.push(context, MaterialPageRoute(builder: (_) {
//                             return About();
//                           }
//                           ));
//                         },
//                         child: ListTile(
//                           leading: Icon(Icons.person),
//                           title: Text("About",style: TextStyle(
//                             fontSize: 15,
//                             fontWeight: FontWeight.w600,
//                           ),
//                           ),
//                           trailing: Icon(Icons.arrow_forward_ios),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.push(context, MaterialPageRoute(builder: (_) {
//                             return Login();
//                           }
//                           ),
//                           );
//                         },
//                         child: ListTile(
//                             title: Text("LogOut",style: TextStyle(
//                               fontSize: 15,
//                               fontWeight: FontWeight.w600,
//                             ),
//                             ),
//                             trailing: Icon(Icons.arrow_forward_ios),
//                             leading: Icon(Icons.logout,color: Colors.black,),
//                             onTap: () {
//                               showDialog(
//                                 context: context,
//                                 builder: ((context) {
//                                   return AlertDialog(
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(10),
//                                     ),
//                                     contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 10),
//                                     title: Row(
//                                       mainAxisAlignment: MainAxisAlignment.end,
//                                       children: [
//                                         Container(
//                                           decoration: BoxDecoration(
//                                             color: Colors.grey,
//                                             borderRadius: BorderRadius.circular(20),
//                                           ),
//                                           child: IconButton(
//                                             onPressed: () {
//                                               Navigator.push(context, MaterialPageRoute(builder: (_){
//                                                 return Login();
//                                               }));
//                                             },
//                                             icon: Icon(
//                                               Icons.clear,
//                                               color: Colors.white,
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     backgroundColor: Colors.grey[200],
//                                     content: Column(
//                                       mainAxisSize: MainAxisSize.min,
//                                       children: [
//                                         Container(
//                                           decoration: BoxDecoration(
//                                             color: Colors.grey,
//                                             borderRadius: BorderRadius.circular(10),
//                                           ),
//                                           child: Image.asset(
//                                             "assets/images/Logout.png",
//                                             height: 80,
//                                           ),
//                                         ),
//                                         SizedBox(height: 20),
//                                         Text(
//                                           "Logout",
//                                           style: TextStyle(
//                                             fontSize: 22,
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                         ),
//                                         SizedBox(height: 10),
//                                         Text(
//                                           "Are you sure you want to logout?",
//                                           textAlign: TextAlign.center,
//                                           style: TextStyle(
//                                             color: Colors.black54,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     actions: [
//                                       Align(
//                                         alignment: Alignment.center,
//                                         child: ConstrainedBox(
//                                           constraints: BoxConstraints.tightFor(
//                                             height: 41,
//                                             width: 184,
//                                           ),
//                                           child: ElevatedButton(
//                                             style: ElevatedButton.styleFrom(
//                                               primary: Color(0xff3F48CC),
//                                               shape: RoundedRectangleBorder(
//                                                 borderRadius: BorderRadius.circular(25),
//                                               ),
//                                             ),
//                                             onPressed: () {
//                                               Navigator.push(context, MaterialPageRoute(builder: (_){
//                                                 return Login();
//                                               }));
//                                             },
//                                             child: Text(
//                                               "Logout Now",
//                                               style: TextStyle(
//                                                 fontSize: 16,
//                                                 fontWeight: FontWeight.bold,
//                                                 color: Colors.white,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   );
//                                 }
//                                 ),
//                               );
//                             }
//                         ),
//                       ),
//                   ]
//                   ),
//                 );
//                 },
//              );
//             }
//            ),
//          );
//         }
//       void uplodedata() async {
//     try {
//       final ref = FirebaseStorage.instance
//           .ref()
//           .child('userImages')
//           .child(widget.uid + '.png');
//       await ref.putFile(selectedImg!);
//       base64Img = await ref.getDownloadURL();
//       FirebaseFirestore.instance.collection('user').doc(widget.uid).update({
//         'profile': base64Img
//
//       }).then((value) {
//         Navigator.push(context, MaterialPageRoute(builder: (_){
//           return MyProfile();
//         }));
//       });
//     }
//     catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text(e.toString()),
//         ),
//       );
//     }
//   }
//    }
//    class userDataModel {
//    void getMyData() {}
//   }
//  class GoogleFonts {
//  }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:psych_diagnosis/Help1.dart';
import 'package:psych_diagnosis/chateHelp.dart';
import 'About.dart';
import 'ChangePassword.dart';
import 'Edit Profile.dart';
import 'Login.dart';
import 'colors.dart';
class ProfilePsychProfile extends StatefulWidget {
  @override
  State<ProfilePsychProfile> createState() => _ProfilePsychProfileState();
}
class _ProfilePsychProfileState extends State<ProfilePsychProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: buttonColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: Text(
          'Profile Setting',
          style: buttonText,
        ),
      ),
      backgroundColor: Colors.white,
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('user')
            .where('userid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
            .snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if(!snapshot.hasData){
            return Text("No Data found");

          }else if ( snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: snapshot.data?.docs.length ?? 0,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 3,
                          decoration: BoxDecoration(
                            color: buttonColor,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 5,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(250),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: 20,
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: CircleAvatar(
                                  backgroundColor: Colors.grey,
                                  radius: 50,
                                  backgroundImage: NetworkImage(
                                    snapshot.data!.docs[index]['profile'],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                textAlign: TextAlign.center,
                                '${snapshot.data!.docs[index]['firstName'] + ' ' + snapshot.data!.docs[index]['LastName']}',
                                style: appbarStyle,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                textAlign: TextAlign.center,
                                '${snapshot.data!.docs[index]['email']}',
                                style: questionStyle,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        height: 30,
                        alignment: Alignment.centerLeft,
                        // margin: EdgeInsets.only(left: 10),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Color(0xffC4C4C4).withOpacity(0.33),
                        ),
                        child: Text(
                          '   Preferences',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff7B8471),
                          ),
                        )),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.02,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 1,
                        child: ListTile(
                          leading: Image.asset(
                            'assets/images/Person.png',
                            height: 36,
                            width: 36,
                          ),
                          title: Text(
                            "Edit Account",
                            style: questionStyle,
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.black,
                            size: 18,
                          ),
                          onTap: () {
                            openScreen(
                              context,
                              EditProfile(
                                profile: snapshot.data?.docs[index]['profile'],
                                firstName: snapshot.data?.docs[index]['firstName'],
                                lastName: snapshot.data?.docs[index]['LastName'],
                                email: snapshot.data?.docs[index]['email'],
                                material: snapshot.data?.docs[index]['status'],
                                sex: snapshot.data?.docs[index]['Sex'],
                                birth: snapshot.data?.docs[index]['Birth'],
                                race: snapshot.data?.docs[index]['Race'],
                                About: snapshot.data?.docs[index]['About'],
                                education: snapshot.data?.docs[index]['education'],
                                uid: snapshot.data?.docs[index]['userid'],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.02,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 1,
                        child: ListTile(
                          leading: Image.asset(
                            'assets/images/Question.png',
                            height: 36,
                            width: 36,
                          ),
                          title: Text(
                            "Help",
                            style: questionStyle,
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.black,
                            size: 18,
                          ),
                          onTap: () {
                            openScreen(context,ScreenHelp());
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.02,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 1,
                        child: ListTile(
                          leading: Image.asset(
                            'assets/images/33.png',
                            height: 36,
                            width: 36,
                          ),
                          title: Text(
                            "Change Password",
                            style: questionStyle,
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.black,
                            size: 18,
                          ),
                          onTap: () {
                            openScreen(context, ChangePassword());
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.02,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 1,
                        child: ListTile(
                          leading: Image.asset(
                            'assets/images/info.png',
                            height: 36,
                            width: 36,
                          ),
                          title: Text(
                            "About",
                            style: questionStyle,
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.black,
                            size: 18,
                          ),
                          onTap: () {
                            openScreen(context, About());
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.02,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 1,
                        child: ListTile(
                          leading: Image.asset(
                            'assets/images/Logout.png',
                            height: 36,
                            width: 36,
                          ),
                          title: Text(
                            "Logout",
                            style: questionStyle,
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.black,
                            size: 18,
                          ),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext? context) {
                                return AlertDialog(
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(),
                                          IconButton(
                                            onPressed: () {
                                              Navigator.pop(context!);
                                            },
                                            icon: Image.asset(
                                              'assets/images/cross.png',
                                              height: 36,
                                              width: 36,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Image.asset(
                                        'assets/images/Logout.png',
                                        height: 55,
                                        width: 55,
                                      ),
                                      SizedBox(
                                        height: 50,
                                      ),
                                      Text(
                                        'Are you sure you want to Logout?',
                                        style: questionStyle,
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      SizedBox(
                                        width:
                                        MediaQuery.of(context!).size.width /
                                            1.30,
                                        child: MaterialButton(
                                          onPressed: () async {
                                            setState(() {
                                              _isLoading = true;
                                            });
                                            final FirebaseAuth _auth =
                                                FirebaseAuth.instance;
                                            await _auth
                                                .signOut()
                                                .whenComplete(() {
                                              openScreen(
                                                  context, Login());
                                            });
                                            setState(() {
                                              _isLoading = false;
                                            });
                                          },
                                          color: buttonColor,
                                          elevation: 4,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(15)),
                                          child: _isLoading
                                              ? CircularProgressIndicator(
                                            valueColor:
                                            AlwaysStoppedAnimation<
                                                Color>(Colors.white),
                                          )
                                              : Text(
                                            'Logout now',
                                            style: buttonText,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
  bool _isLoading = false;
}


