import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
class EditProfile extends StatefulWidget {
  final  uid;
  const EditProfile({Key? key, required this.uid, required profile, required firstName, required lastName, required material, required email, required sex, required birth, required race, required About, required education}) : super(key: key);
  @override
  State<EditProfile> createState() => _EditProfileState();
}
class _EditProfileState extends State<EditProfile> {
  TextEditingController FirstnameController = TextEditingController();
  TextEditingController LastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController MartialStatusController = TextEditingController();
  TextEditingController  RaceController = TextEditingController();
  TextEditingController SexController = TextEditingController();
  TextEditingController DateOfBirthController = TextEditingController();
  TextEditingController AboutController = TextEditingController();
  TextEditingController EducationController =TextEditingController();
  bool loading = false;
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
        title: Text("Edit Profile",style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        ),
        actions: [
          Padding(padding: EdgeInsets.only(left: 110)),
          // TextButton(onPressed:(){
          //   Navigator.push(context, MaterialPageRoute(builder: (_){
          //     return EditProfile(uid:widget.uid);
          //   }));
          // } , child: Text("Edit",style: TextStyle(
          //   fontSize: 18,
          //   fontWeight: FontWeight.w400,
          // ),
          // ),
          // ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 110,
                  width: 110,
                  child: CircleAvatar(
                    backgroundImage: (selectedImage != null) ? FileImage(
                        selectedImage!) : null,
                    backgroundColor: Colors.white,
                    child: Center(
                        child: (selectedImage == null)
                            ? CircleAvatar(
                          radius: 50,
                          //backgroundImage: NetworkImage(widget.userImg),
                        )
                            : null),
                    radius: 50,
                  ),
                ),
                Positioned(
                  top: 72,
                  left: 81,
                  child: GestureDetector(
                    onTap: () {
                      chooseImage(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xffD8543B), shape: BoxShape.circle),
                      height: 30,
                      width: 30,
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 30)),
                Text("First Name",style: TextStyle(
                  fontSize: 12,
                  fontFamily: "Segoe UI",
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),),
              ],
            ),
            Container(
              height: 40,
              //  width: 350,
              padding: EdgeInsets.only(left: 20,right: 20),
              child: TextFormField(
                controller: FirstnameController,
                decoration: InputDecoration(
                  hintText: "Masaryk",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 30)),
                Text("Last Name",style: TextStyle(
                  fontSize: 12,
                  fontFamily: "Segoe UI",
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),),
              ],
            ),
            Container(
              height: 40,
              padding: EdgeInsets.only(left: 20,right: 20),
              child: TextFormField(
                controller: LastNameController,
                decoration: InputDecoration(
                  hintText: "Jeson",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 30)),
                Text("Email",style: TextStyle(
                  fontSize: 12,
                  fontFamily: "Segoe UI",
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),),
              ],
            ),
            Container(
              height: 40,
              padding: EdgeInsets.only(left: 20,right: 20),
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: "abc123@gmail.com",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 30)),
                Text("Marital Status",style: TextStyle(
                  fontSize: 12,
                  fontFamily: "Segoe UI",
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),),
              ],
            ),
            Container(
              height: 40,
              padding: EdgeInsets.only(left: 20,right: 20),
              child: TextFormField(
                controller: MartialStatusController,
                decoration: InputDecoration(
                  hintText: "Married",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 30,)),
                Text("Education",style: TextStyle(
                  fontSize: 12,
                  fontFamily: "Segoe UI",
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),),
              ],
            ),
            Container(
              height: 40,
              padding: EdgeInsets.only(left: 20,right: 20),
              child: TextFormField(
                controller: EducationController,
                decoration: InputDecoration(
                  hintText: "College Graduate",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 30,)),
                Text("Sex",style: TextStyle(
                  fontSize: 12,
                  fontFamily: "Segoe UI",
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),),
              ],
            ),
            Container(
              height: 40,
              padding: EdgeInsets.only(left: 20,right: 20),
              child: TextFormField(
                controller: SexController,
                decoration: InputDecoration(
                  hintText: "Male",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 30,)),
                Text("Date of birth",style: TextStyle(
                  fontSize: 12,
                  fontFamily: "Segoe UI",
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
                ),
              ],
            ),
            Container(
              height: 40,
              padding: EdgeInsets.only(left: 20,right: 20),
              child: TextFormField(
                controller: DateOfBirthController,
                decoration: InputDecoration(
                  hintText: "Jan 16, 2002",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 30,)),
                Text("About",style: TextStyle(
                  fontSize: 12,
                  fontFamily: "Segoe UI",
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),),
              ],
            ),
            Container(
              height: 40,
              padding: EdgeInsets.only(left: 20,right: 20),
              child: TextFormField(
                controller: AboutController,
                decoration: InputDecoration(
                  hintText: "Hey, I am jhone doe, about text will show here",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: TextButton(
                style: TextButton.styleFrom(backgroundColor: Color(0xff3F48CC),
                  minimumSize: Size(230, 43),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: Text("Update",style: TextStyle(
                  color: Colors.white,
                ),
                ),
                onPressed: (){
                  uplodedata();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
  void uplodedata() async {
    var _auth = FirebaseAuth.instance;
    try {
      setState(() {
        loading = true;
      });

      final User? user = _auth.currentUser;
      final userid = user!.uid;
      final ref = FirebaseStorage.instance.ref().child('userImages').child(userid + '.jpg');

      if (selectedImage != null) {
        // If a new image is selected, upload it to Firebase Storage
        await ref.putFile(selectedImage!);
        base64Image = await ref.getDownloadURL();
      }

      final userData = {
        if (selectedImage != null) 'profile': base64Image,
        if (FirstnameController.text.isNotEmpty) 'firstName': FirstnameController.text.trim(),
        if (LastNameController.text.isNotEmpty) 'LastName': LastNameController.text.trim(),
        if (emailController.text.isNotEmpty) 'email': emailController.text.trim(),
        if (DateOfBirthController.text.isNotEmpty) 'Birth': DateOfBirthController.text.trim(),
        if (RaceController.text.isNotEmpty) 'Race': RaceController.text.trim(),
        if (SexController.text.isNotEmpty) 'Sex': SexController.text.trim(),
        if (MartialStatusController.text.isNotEmpty) 'Martial': MartialStatusController.text.trim(),
        if (AboutController.text.isNotEmpty) 'About': AboutController.text.trim(),
        if (EducationController.text.isNotEmpty) 'Education': EducationController.text.trim(),
      };

      FirebaseFirestore.instance.collection('user').doc(userid).update(userData);

      setState(() {
        loading = false;
      });

      print("Data uploaded successfully");
      Navigator.pop(context);
    } catch (error) {
      print(error.toString());
    }
  }


  File? selectedImage;
  var base64Image = "";

  Future<void> chooseImage(type) async {
    var image;
    if (type == "camera") {
      image = await ImagePicker().pickImage(
        source: ImageSource.camera,
      );
    } else {
      image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );
    }
    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
        base64Image = base64Encode(selectedImage!.readAsBytesSync());
        // won't have any error now
      });
    }
  }
  Future<void> _choiseShowDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Select Image From"),
            actions: [
              GestureDetector(
                child: Text(
                  "Gallery",
                  style: TextStyle(color: Colors.blue),
                ),
                onTap: () {
                  chooseImage("Gallery");
                  Navigator.pop(context);
                },
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: GestureDetector(
                  child: Text(
                    "camera",
                    style: TextStyle(color: Colors.cyan),
                  ),
                  onTap: () {
                    chooseImage("camera");
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          );
        });
  }
}





// import 'dart:convert';
// import 'dart:io';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:intl/intl.dart';
// import 'colors.dart';
// class ProfilePsychEditAccount extends StatefulWidget {
//   final profile;
//   final firstName;
//   final lastName;
//   final email;
//   final material;
//   final sex;
//   final birth;
//   final race;
//   final about;
//   final education;
//   const ProfilePsychEditAccount({
//     super.key,
//     required this.profile,
//     required this.education,
//     required this.firstName,
//     required this.lastName,
//     required this.email,
//     required this.material,
//     required this.sex,
//     required this.birth,
//     required this.race,
//     required this.about
//   });
//   @override
//   State<ProfilePsychEditAccount> createState() =>
//       _ProfilePsychEditAccountState();
// }
//
// class _ProfilePsychEditAccountState extends State<ProfilePsychEditAccount> {
//   // var firstName;
//   // var lastName;
//   // var email;
//   // var about;
//   // var profile;
//   // var birth;
//
//   // Future<void> getUserData() async {
//   //   var userData = await FirebaseFirestore.instance
//   //       .collection('users')
//   //       .doc(FirebaseAuth.instance.currentUser!.uid)
//   //       .get();
//   //   setState(() {
//   //     firstName = userData.get('firstName');
//   //     lastName = userData.get('lastName');
//   //     email = userData.get('email');
//   //     about = userData.get('about') ?? null;
//   //
//   //     // sex = userData.get('sex') ?? null;
//   //     // race = userData.get('race') ?? null;
//   //     // material = userData.get('status') ?? null;
//   //     birth = userData.get('birth') ?? null;
//   //     fnameController.text = firstName ?? '';
//   //     lanameController.text = lastName ?? '';
//   //     emailController.text = email ?? '';
//   //     aboutController.text = about ?? '';
//   //     dateinput.text = birth ?? '';
//   //     profile = userData.get('profile');
//   //     selectedImage = profile;
//   //   });
//   // }
//
//   var lanameController = TextEditingController();
//   var emailController = TextEditingController();
//   var aboutController = TextEditingController();
//   var dateinput = TextEditingController();
//   TextEditingController fnameController = TextEditingController();
//   @override
//   void initState() {
//     setState(() {
//       // getUserData();
//     });
//     super.initState();
//   }
//
//   String? education;
//   var eduItems = [
//     'Matriculation',
//     'Intermediate',
//     'Graduation',
//     'M Phil',
//     'Phd',
//     'Other',
//   ];
//   @override
//   Widget build(BuildContext context) {
//     // var size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text(
//           'Edit Profile',
//           style: appbarStyle,
//         ),
//         centerTitle: true,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: Icon(
//             Icons.arrow_back_ios,
//             color: Colors.black,
//           ),
//         ),
//         backgroundColor: Colors.white,
//         elevation: 1,
//       ),
//       body: Align(
//         alignment: Alignment.center,
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 10,
//               ),
//               Container(
//                 height: 115,
//                 width: 100,
//                 child: Stack(
//                   children: [
//                     CircleAvatar(
//                       radius: 50,
//                       backgroundColor: buttonColor.withOpacity(0.50),
//                       child: selectedImage != null
//                           ? CircleAvatar(
//                         radius: 50,
//                         backgroundImage: FileImage(selectedImage!),
//                       )
//                           : widget.profile != null
//                           ? CircleAvatar(
//                         radius: 50,
//                         backgroundImage: NetworkImage(widget.profile),
//                       )
//                           : CircularProgressIndicator(),
//                     ),
//
//                     // CircleAvatar(
//                     //   radius: 50,
//                     //   backgroundColor: buttonColor.withOpacity(0.50),
//                     //   backgroundImage: selectedImage == null
//                     //       // ? Image.asset('assets/logo/doctor_image.png')
//                     //       //     as ImageProvider
//                     //       ? NetworkImage('${widget.profile}') as ImageProvider
//                     //       : FileImage(selectedImage!),
//                     // ),
//                     Positioned(
//                       top: 60,
//                       bottom: 0,
//                       right: 0,
//                       child: IconButton(
//                         onPressed: () {
//                           _choiseShowDialog(context);
//                         },
//                         icon: Image.asset(
//                           'assets/images/Logo.png',
//                           height: 36,
//                           width: 36,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Container(
//                   width: MediaQuery.of(context).size.width / 1.10,
//                   margin: EdgeInsets.only(left: 20, top: 10),
//                   child: Text(
//                     'First Name',
//                     style: textFieldStyle,
//                   ),
//                 ),
//               ),
//               Container(
//                 width: MediaQuery.of(context).size.width / 1.10,
//                 child: TextFormField(
//                   cursorColor: buttonColor,
//                   controller: fnameController..text = widget.firstName,
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Color(0xff000000).withOpacity(0.10),
//                     contentPadding: EdgeInsets.only(
//                       left: 10,
//                     ),
//                     border: OutlineInputBorder(
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return "First Name Required";
//                     } else
//                       return null;
//                   },
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Container(
//                   width: MediaQuery.of(context).size.width / 1.10,
//                   margin: EdgeInsets.only(left: 20, top: 10),
//                   child: Text(
//                     'Last Name',
//                     style: textFieldStyle,
//                   ),
//                 ),
//               ),
//               Container(
//                 width: MediaQuery.of(context).size.width / 1.10,
//                 child: TextFormField(
//                   cursorColor: buttonColor,
//                   controller: lanameController..text = widget.lastName,
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Color(0xff000000).withOpacity(0.10),
//                     contentPadding: EdgeInsets.only(
//                       left: 10,
//                     ),
//                     border: OutlineInputBorder(
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return "Last Name Required";
//                     } else
//                       return null;
//                   },
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Container(
//                   width: MediaQuery.of(context).size.width / 1.10,
//                   margin: EdgeInsets.only(left: 20, top: 10),
//                   child: Text(
//                     'Email',
//                     style: textFieldStyle,
//                   ),
//                 ),
//               ),
//               Container(
//                 width: MediaQuery.of(context).size.width / 1.10,
//                 child: TextFormField(
//                   cursorColor: buttonColor,
//                   controller: emailController..text = widget.email,
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Color(0xff000000).withOpacity(0.10),
//                     contentPadding: EdgeInsets.only(
//                       left: 10,
//                     ),
//                     border: OutlineInputBorder(
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return "Email Required";
//                     } else
//                       return null;
//                   },
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Container(
//                   width: MediaQuery.of(context).size.width / 1.10,
//                   margin: EdgeInsets.only(left: 20, top: 10),
//                   child: Text(
//                     'Material Status',
//                     style: textFieldStyle,
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 width: MediaQuery.of(context).size.width / 1.10,
//                 child: DropdownButtonFormField(
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Color(0xff000000).withOpacity(0.10),
//                     contentPadding: EdgeInsets.symmetric(horizontal: 10),
//                     border: UnderlineInputBorder(
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                   value: material ?? items.first,
//                   isExpanded: true,
//                   onChanged: (value) {
//                     setState(() {
//                       material = value as String?;
//                     });
//                   },
//                   onSaved: (value) {
//                     setState(() {
//                       material = value as String?;
//                     });
//                   },
//                   items: items.map((item) {
//                     return DropdownMenuItem(
//                       value: item,
//                       child: Text(
//                         item,
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 14,
//                           fontWeight: FontWeight.w400,
//                         ),
//                       ),
//                     );
//                   }).toList(),
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Container(
//                   width: MediaQuery.of(context).size.width / 1.10,
//                   margin: EdgeInsets.only(left: 20, top: 10),
//                   child: Text(
//                     'Sex',
//                     style: textFieldStyle,
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 width: MediaQuery.of(context).size.width / 1.10,
//                 child: DropdownButtonFormField(
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Color(0xff000000).withOpacity(0.10),
//                     contentPadding: EdgeInsets.symmetric(
//                       horizontal: 10,
//                     ),
//                     border: UnderlineInputBorder(
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                   value: sex ?? sexItem.first,
//                   isExpanded: true,
//                   onChanged: (value) {
//                     setState(() {
//                       sex = value! as String?;
//                     });
//                   },
//                   onSaved: (value) {
//                     setState(() {
//                       sex = value! as String?;
//                     });
//                   },
//                   items: sexItem.map((String sexItem) {
//                     return DropdownMenuItem(
//                       value: sexItem,
//                       child: Text(
//                         sexItem,
//                       ),
//                     );
//                   }).toList(),
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Container(
//                   width: MediaQuery.of(context).size.width / 1.10,
//                   margin: EdgeInsets.only(left: 20, top: 10),
//                   child: Text(
//                     'Education',
//                     style: textFieldStyle,
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 width: MediaQuery.of(context).size.width / 1.10,
//                 child: DropdownButtonFormField(
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Color(0xff000000).withOpacity(0.10),
//                     contentPadding: EdgeInsets.symmetric(
//                       horizontal: 10,
//                     ),
//                     border: UnderlineInputBorder(
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                   value: education ?? eduItems.first,
//                   isExpanded: true,
//                   onChanged: (value) {
//                     setState(() {
//                       education = value! as String?;
//                     });
//                   },
//                   onSaved: (value) {
//                     setState(() {
//                       education = value! as String?;
//                     });
//                   },
//                   items: eduItems.map((String eduItems) {
//                     return DropdownMenuItem(
//                       value: eduItems,
//                       child: Text(
//                         eduItems,
//                       ),
//                     );
//                   }).toList(),
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Container(
//                   width: MediaQuery.of(context).size.width / 1.10,
//                   margin: EdgeInsets.only(left: 20, top: 10),
//                   child: Text(
//                     'Race',
//                     style: textFieldStyle,
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 width: MediaQuery.of(context).size.width / 1.10,
//                 child: DropdownButtonFormField(
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Color(0xff000000).withOpacity(0.10),
//                     contentPadding: EdgeInsets.symmetric(
//                       horizontal: 10,
//                     ),
//                     border: UnderlineInputBorder(
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                   value: race ?? raceItem.first,
//                   isExpanded: true,
//                   onChanged: (value) {
//                     setState(() {
//                       race = value! as String?;
//                     });
//                   },
//                   onSaved: (value) {
//                     setState(() {
//                       race = value! as String?;
//                     });
//                   },
//                   items: raceItem.map((String raceItem) {
//                     return DropdownMenuItem(
//                       value: raceItem,
//                       child: Text(
//                         raceItem,
//                       ),
//                     );
//                   }).toList(),
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Container(
//                   width: MediaQuery.of(context).size.width / 1.10,
//                   margin: EdgeInsets.only(left: 20, top: 10),
//                   child: Text(
//                     'Date of Birth',
//                     style: textFieldStyle,
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 50,
//                 width: MediaQuery.of(context).size.width / 1.10,
//                 child: TextField(
//                   cursorColor: buttonColor,
//                   controller: dateinput..text = widget.birth,
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Color(0xff000000).withOpacity(0.10),
//                     border: OutlineInputBorder(
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                   readOnly: true,
//                   onTap: () async {
//                     DateTime? pickedDate = await showDatePicker(
//                       context: context,
//                       initialDate: DateTime.now(),
//                       firstDate: DateTime(1900),
//                       lastDate: DateTime(5000),
//                       builder: (context, child) {
//                         return Theme(
//                           data: Theme.of(context).copyWith(
//                             colorScheme: ColorScheme.light(
//                               primary: buttonColor,
//                               onPrimary: Colors.white,
//                               onSurface: Colors.black,
//                             ),
//                             textButtonTheme: TextButtonThemeData(
//                               style: TextButton.styleFrom(
//                                 backgroundColor: buttonColor,
//                               ),
//                             ),
//                           ),
//                           child: child!,
//                         );
//                       },
//                     );
//
//                     if (pickedDate != null) {
//                       print(pickedDate);
//                       String formattedDate =
//                       DateFormat('yyyy-MM-dd').format(pickedDate);
//                       print(formattedDate);
//                       setState(() {
//                         dateinput.text = formattedDate;
//                       });
//                     } else {
//                       print("Date is not selected");
//                     }
//                   },
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Container(
//                   width: MediaQuery.of(context).size.width / 1.10,
//                   margin: EdgeInsets.only(left: 20, top: 10),
//                   child: Text(
//                     'About',
//                     style: textFieldStyle,
//                   ),
//                 ),
//               ),
//               Container(
//                 // margin: EdgeInsets.symmetric(
//                 //   vertical: 20,
//                 // ),
//                 width: MediaQuery.of(context).size.width / 1.10,
//                 child: TextFormField(
//                   cursorColor: buttonColor,
//                   controller: aboutController..text = widget.about,
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Color(0xff000000).withOpacity(0.10),
//                     contentPadding: EdgeInsets.only(
//                       left: 10,
//                     ),
//                     border: OutlineInputBorder(
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return "First Name Required";
//                     } else
//                       return null;
//                   },
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               SizedBox(
//                 width: MediaQuery.of(context).size.width / 1.30,
//                 child: MaterialButton(
//                   onPressed: () {
//                     uplodedata();
//                   },
//                   color: buttonColor,
//                   elevation: 4,
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(15)),
//                   child: isloading
//                       ? CircularProgressIndicator(
//                     valueColor:
//                     AlwaysStoppedAnimation<Color>(Colors.white),
//                   )
//                       : Text(
//                     'Update',
//                     style: buttonText,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         // StreamBuilder<QuerySnapshot>(
//         //     stream: FirebaseFirestore.instance
//         //         .collection('users')
//         //         .where('uid',
//         //         isEqualTo: FirebaseAuth.instance.currentUser!.uid)
//         //         .snapshots(),
//         //     builder: (context, snapshot) {
//         //       return ListView.builder(
//         //         shrinkWrap: true,
//         //         itemCount: snapshot.data?.docs.length ?? 0,
//         //         itemBuilder: (BuildContext context, int index) {
//
//         //
//         //           return ;
//         //     },);
//         //   }
//         // ),
//       ),
//     );
//   }
//
//   Future<void> _choiseShowDialog(BuildContext context) async {
//     return showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text("Select Image From"),
//           actions: [
//             GestureDetector(
//               child: Text(
//                 "Gallery",
//                 style: TextStyle(color: buttonColor),
//               ),
//               onTap: () {
//                 chooseImage("Gallery");
//                 Navigator.pop(context);
//               },
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Container(
//               margin: EdgeInsets.all(10),
//               child: GestureDetector(
//                 child: Text(
//                   "camera",
//                   style: TextStyle(color: buttonColor),
//                 ),
//                 onTap: () {
//                   chooseImage("camera");
//                   Navigator.pop(context);
//                 },
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   void uplodedata() async {
//     var _auth = await FirebaseAuth.instance;
//     try {
//       setState(() {
//         isloading = true;
//       });
//       final User? user = _auth.currentUser;
//       final userid = user!.uid;
//       final ref = FirebaseStorage.instance
//           .ref()
//           .child('userImages')
//           .child(userid + '.jpg');
//       await ref.putFile(selectedImage!);
//       base64Image = await ref.getDownloadURL();
//       FirebaseFirestore.instance.collection('user').doc(userid).update({
//         'birth': dateinput.text.trim(),
//         'race': race.toString().trim(),
//         'sex': sex.toString().trim(),
//         'status': material.toString().trim(),
//         'about': aboutController.text.toString().trim(),
//         'firstName': fnameController.text.toString().trim(),
//         'LastName': lanameController.text.toString().trim(),
//         'email': emailController.text.toString().trim(),
//         'profile': base64Image,
//       });
//       setState(() {
//         isloading = false;
//       });
//       print("Data upload successfully");
//       Navigator.pop(context);
//     } catch (error) {
//       print(error.toString());
//     }
//   }
//
//   File? selectedImage;
//   var base64Image = "";
//
//   Future<void> chooseImage(type) async {
//     var image;
//     if (type == "camera") {
//       image = await ImagePicker().pickImage(
//         source: ImageSource.camera,
//       );
//     } else {
//       image = await ImagePicker().pickImage(
//         source: ImageSource.gallery,
//       );
//     }
//     if (image != null) {
//       setState(() {
//         selectedImage = File(image.path);
//         base64Image = base64Encode(selectedImage!.readAsBytesSync());
//         // won't have any error now
//       });
//     }
//   }
//
//   String? material;
//   var items = [
//     'Married',
//     'Living with Someone',
//     'Widowed',
//     'Separated',
//     'Divorced',
//     'Never Married',
//   ];
//   String? sex;
//   var sexItem = [
//     'Male',
//     'Female',
//     'Other',
//   ];
//   String? race;
//   var raceItem = [
//     'White',
//     'Black',
//     'Hispanic',
//     'Asian',
//     'Portuguese',
//     'Other',
//   ];
//   bool isloading = false;
// }

