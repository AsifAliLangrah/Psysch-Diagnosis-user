//
// import 'package:flutter/material.dart';
// import 'package:flutter_chat_bubble/chat_bubble.dart';
// class HelpChat extends StatefulWidget {
//   const HelpChat({super.key});
//   @override
//   State<HelpChat> createState() => _HelpChatState();
// }
// class _HelpChatState extends State<HelpChat> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.transparent,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back_ios_new,color: Colors.black),
//           onPressed: (){
//             Navigator.pop(context);
//           },
//         ),
//         title: Row(
//           children: [
//             CircleAvatar(
//               backgroundImage: AssetImage("assets/images/asif.jpg"),
//             ),
//             Text("Dr. Alex Jack",style:TextStyle(
//               color: Colors.black,
//             ) ,),
//           ],
//         ),
//         ),
//       body: SingleChildScrollView(
//         child: Container(
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               children: [
//                 ChatBubble(
//                   clipper: ChatBubbleClipper1(type: BubbleType.sendBubble),
//                   alignment: Alignment.centerLeft,
//                   margin: EdgeInsets.only(top: 5),
//                   backGroundColor: Color(0xffED1C24),
//                   child: Container(
//                     constraints: BoxConstraints(
//                       maxWidth: MediaQuery.of(context).size.width * 0.7,
//                     ),
//                     child: Text(
//                       "Sure, no problem. I’ll see you at 9:30am",
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 15,
//                 ),
//                 ChatBubble(
//                   clipper: ChatBubbleClipper1(type: BubbleType.sendBubble),
//                   alignment: Alignment.topRight,
//                   margin: EdgeInsets.only(top: 5),
//                   backGroundColor: Color(0xff3F48CC),
//                   child: Container(
//                     constraints: BoxConstraints(
//                       maxWidth: MediaQuery.of(context).size.width * 0.7,
//                     ),
//                     child: Text(
//                       "Hello, Dr. Alex Jack ",
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                 ),
//                 ChatBubble(
//                   clipper: ChatBubbleClipper1(type: BubbleType.sendBubble),
//                   alignment: Alignment.centerLeft,
//                   margin: EdgeInsets.only(top: 5),
//                   backGroundColor: Color(0xffD7D7D7),
//                   child: Container(
//                     constraints: BoxConstraints(
//                       maxWidth: MediaQuery.of(context).size.width * 0.7,
//                     ),
//                     child: Text(
//                       "Yes, How can i help you?",
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 15,
//                 ),
//                 ChatBubble(
//                   clipper: ChatBubbleClipper1(type: BubbleType.sendBubble),
//                   alignment: Alignment.centerLeft,
//                   margin: EdgeInsets.only(top: 5),
//                   backGroundColor: Color(0xffD7D7D7),
//                   child: Container(
//                     constraints: BoxConstraints(
//                       maxWidth: MediaQuery.of(context).size.width * 0.7,
//                     ),
//                     child: Text(
//                       "....",
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                 ),
//                 Padding(padding:EdgeInsets.only(top: 450) ),
//               Row(
//                 children: [
//                   Container(
//                     width: 280,
//                     height: 35,
//                     child:
//                     TextField(
//                       decoration: InputDecoration(
//                           filled: true,
//                           fillColor: Color(0xffE5E5E5),
//                           hintText: "Type a message",
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(0),
//                               borderSide: BorderSide(color: Colors.white))),
//                     ),
//                   ),
//                   SizedBox(
//                     width: 5,
//                   ),
//                   TextButton(
//
//                     style: TextButton.styleFrom(
//                       backgroundColor: Color(0xff3F48CC),
//                       minimumSize: Size(40, 30),
//                     ),
//                     onPressed: () {
//                       Navigator.push(context, MaterialPageRoute(builder: (_) {
//                         return HelpChat();
//                       }));
//                     },
//                     child: Text(
//                       "Send",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 18,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//
//
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//}
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class ChatPage extends StatefulWidget {
//   final String name;
//   final String url;
//   final String uid;
//   final String email;
//
//   ChatPage({
//     required this.name,
//     required this.url,
//     required this.uid,
//     required this.email, required providerId, required profile, required text,
//   });
//
//   @override
//   _ChatPageState createState() => _ChatPageState();
// }
//
// class _ChatPageState extends State<ChatPage> {
//   final FirebaseFirestore _db = FirebaseFirestore.instance;
//   final TextEditingController _textEditingController = TextEditingController();
//   final ScrollController _scrollController = ScrollController();
//   String getChatRoomId(String a, String b) {
//     if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
//       return "$b\_$a";
//     } else {
//       return "$a\_$b";
//     }
//   }
//
//   String otherUserUid = ""; // Initialize the other user's UID
//
//   @override
//   void initState() {
//     super.initState();
//     otherUserUid = widget.uid;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         // leading: IconButton(
//         //   icon: Icon(Icons.arrow_back_ios,color: Colors.black),
//         //   onPressed: (){
//         //     Navigator.pop(context);
//         //   },
//         // ),
//         backgroundColor: Colors.white,
//         automaticallyImplyLeading: false,
//         elevation: 1,
//         title: ListTile(
//           contentPadding: EdgeInsets.zero,
//           title: Text(widget.name),
//           subtitle: Text(widget.email),
//           leading: CircleAvatar(
//             radius: 20,
//             backgroundImage: (widget.url != "" &&
//                 Uri.parse(widget.url).isAbsolute)
//                 ? NetworkImage("${widget.url}")
//                 : AssetImage("assets/images/asif.jpg")
//             as ImageProvider<Object>?,
//           ),
//         ),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: StreamBuilder<QuerySnapshot>(
//               stream: _db
//                   .collection('chats')
//                   .doc(getChatRoomId(
//                   FirebaseAuth.instance.currentUser!.uid, otherUserUid))
//                   .collection('messages')
//                   .orderBy('timestamp')
//                   .snapshots(),
//               builder: (context, snapshot) {
//                 if (!snapshot.hasData) {
//                   return Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }
//                 final messages = snapshot.data!.docs.toList();
//                 return ListView.builder(
//                   controller: _scrollController,
//                   itemCount: messages.length,
//                   itemBuilder: (context, index) {
//                     final message = messages[index]['message'];
//                     final sender = messages[index]['sender'];
//                     return Padding(
//                       padding:
//                       EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//                       child: Align(
//                         alignment:
//                         sender == FirebaseAuth.instance.currentUser!.uid
//                             ? Alignment.centerRight
//                             : Alignment.centerLeft,
//                         child: Container(
//                           padding: EdgeInsets.all(8),
//                           decoration: BoxDecoration(
//                             color:
//                             sender == FirebaseAuth.instance.currentUser!.uid
//                                 ? Colors.blue[300]
//                                 : Colors.grey[300],
//                             borderRadius: BorderRadius.circular(16),
//                           ),
//                           child: Text(
//                             message,
//                             style: TextStyle(color: Colors.black),
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//           Container(
//             color: Color(0xfffFFFFFF),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: Padding(
//                     padding: EdgeInsets.all(16),
//                     child: TextFormField(
//                       controller: _textEditingController,
//                       decoration: InputDecoration(
//                         filled: true,
//                         fillColor: Colors.grey.shade200, // Set the background color to gray
//                         hintText: 'Type a message',
//                         border: OutlineInputBorder( // Add an outline border
//                           borderRadius: BorderRadius.circular(25),
//                           borderSide: BorderSide(
//                             color: Colors.grey.shade400, // Set the border color
//                             width: 1.0, // Set the border width
//                           ),
//                         ),
//                         contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.all(8),
//                   child: ElevatedButton(
//                     onPressed: () async {
//                       if (_textEditingController.text.trim().isNotEmpty) {
//                         final message = _textEditingController.text.trim();
//                         _textEditingController.clear();
//                         await _db
//                             .collection('chats')
//                             .doc(getChatRoomId(
//                             FirebaseAuth.instance.currentUser!.uid,
//                             otherUserUid))
//                             .collection('messages')
//                             .add({
//                           'uid': FirebaseAuth.instance.currentUser!.uid,
//                           'message': message,
//                           'sender': FirebaseAuth.instance.currentUser!.uid,
//                           'timestamp': FieldValue.serverTimestamp(),
//                           'receiver id':FirebaseAuth.instance.currentUser!.uid
//                         });
//                         _scrollController.animateTo(
//                           _scrollController.position.maxScrollExtent,
//                           duration: Duration(milliseconds: 300),
//                           curve: Curves.easeOut,
//                         );
//                       }
//                     },
//                     child: Icon(Icons.send),
//                     style: ElevatedButton.styleFrom(
//                       shape: CircleBorder(),
//                       padding: EdgeInsets.all(16),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
