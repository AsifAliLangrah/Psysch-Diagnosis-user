// import 'dart:io';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:psych_diagnosis/Result%20screen.dart';
// import 'package:psych_diagnosis/chateScreen.dart';
//  class ConnectWithDoctor extends StatefulWidget {
//   const ConnectWithDoctor({Key? key}) : super(key: key);
//   @override
//   State<ConnectWithDoctor> createState() => _ConnectWithDoctorState();
//  }
//  class _ConnectWithDoctorState extends State<ConnectWithDoctor> {
//    String name = 'Name Loading';
//    void getData()async{
//      User? user = await FirebaseAuth.instance.currentUser;
//      var vari = await FirebaseFirestore.instance.collection('admin').doc(user?.uid).get();
//      setState(() {
//        name = vari.data()!['Name'];
//      });
//    }
//    void initState(){
//      getData();
//      FirebaseAuth auth = FirebaseAuth.instance;
//      final currentUser = auth.currentUser;
//      final myCollection = FirebaseFirestore.instance.collection('admin');
//      final myQuery = myCollection.where('userid');
//      // TODO: implement initState
//      super.initState();
//      userDataModel userModel = userDataModel();
//      userModel.getMyData();
//      super.initState();
//    }
//    bool loading = false;
//    File? selectedImg;
//    var base64Img = "";
//    var _img;
//    String? imgUrl;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.transparent,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back,color: Colors.black),
//           onPressed: (){
//             Navigator.pop(context);
//           },
//         ),
//         title: Text("Connect with Doctor",style: TextStyle(
//           fontSize: 20,
//           fontWeight: FontWeight.w600,
//           color: Colors.black,
//         ),),
//         actions: [
//           Row(
//             children: [
//               Icon(Icons.search,color: Color(0xfff000000),),
//             ],
//           )
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           child: Column(
//             children: [
//               StreamBuilder<QuerySnapshot>(
//                   stream:
//                   FirebaseFirestore.instance.collection('admin').snapshots(),
//                   builder: (context, snapshot) {
//                     if ( snapshot.hasError) {
//                       return Text('Something went wrong');
//                     }
//
//                     if ( snapshot.connectionState == ConnectionState.waiting) {
//                       return Align(
//                         alignment: Alignment.center,
//                         child: Container(
//                           height: 30,
//                           width: 30,
//                           child: CircularProgressIndicator(),
//                         ),
//                       );
//                     }
//             return  Container(
//                 height: 800,
//                 child: ListView.builder(
//                     itemCount: snapshot.data?.docs.length,
//                     itemBuilder: (BuildContext context, int index) {
//                       return Padding(
//                         padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
//                         child: Container(
//                             width: 345,
//                             height: 60,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(4),
//                                 color: Colors.white,
//                                 boxShadow: [BoxShadow(
//                                     color: Colors.black,
//                                     blurRadius: 1
//                                 )]
//                             ),
//                           child:  ListTile(
//                             leading:CircleAvatar(
//                               backgroundImage: NetworkImage(snapshot.data!.docs[index]["profile"]),
//                             ),
//                             title:  Text('${snapshot.data?.docs[index]['firstName']}${snapshot.data?.docs[index]['LastName']}',
//                               style: TextStyle(
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                             trailing:TextButton(
//                               style: TextButton.styleFrom(backgroundColor: Color(0xff3F48CC),
//                                   minimumSize: Size(64, 23),
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(25),
//                                   )
//                               ),
//                               child: Text("Connect",style: TextStyle(
//                                 color: Colors.white,
//                               ),),
//                               onPressed: (){
//                                 Navigator.push(context, MaterialPageRoute(builder: (_){
//                                   return UserChatScreen(providerId:'adminId', profile: 'profile', name: 'firstName', text: '',);
//                                 }));
//                               },
//                               //  child: Image.asset("assets/image/facebook.png",height: 35,width: 35,),
//                             ),
//                           ),
//                         ),
//                       );
//                     }
//                     ),
//             );
//                   }
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// class userDataModel {
//   void getMyData() {}
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'Layout_Connect to Doctor.dart';
import 'colors.dart';
class ConnectToDoctor extends StatefulWidget {
  const ConnectToDoctor({Key? key}) : super(key: key);
  @override
  State<ConnectToDoctor> createState() => _ConnectToDoctorState();
}
class _ConnectToDoctorState extends State<ConnectToDoctor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_sharp,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Connect with Doctor",
          style: appbarStyle,
        ),
        actions: [
          // Icon(
          //   Icons.search_outlined,
          //   color: Colors.black,
          // ),
          SizedBox(
            width: 10,
          ),
        ],
        centerTitle: true,
        elevation: 1,
        backgroundColor: Colors.white,
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('admin').snapshots(),
          builder: (context, snapshot) {
            return snapshot.data?.size == 0
                ? Center(
              child:
              Text(
                'No Doctor Found',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            )
                : ListView.builder(
              itemCount: snapshot.data?.docs.length ?? 0,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                var data = snapshot.data!.docs[index];


                  // return  UserChatScreen(providerId: data['userid'], profile: data['profile'], name: data['firstName'] + data['LastName'], text: '',);
                return LayoutConnectToDoctor(
                  name: data['firstName'] + data['LastName'],
                  providerId: data['userid'],
                  profile: data['profile'],
                );
              },
            );
          }),
    );
  }
}



