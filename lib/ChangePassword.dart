import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:psych_diagnosis/MyProfile.dart';
class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);
  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}
class _ChangePasswordState extends State<ChangePassword> {
  var OldPasswordController = TextEditingController();
  var NewPasswordController = TextEditingController();
  var  ConfirmPasswordController = TextEditingController();
bool _isLoading = false;
  Future<void> changePassword() async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    User? user = await _auth.currentUser;
    if (user == null) {
      // Handle user not signed in
      print('user not signed in');
      return;
    }
    AuthCredential credential = EmailAuthProvider.credential(
      email: user.email ?? '',
      password: OldPasswordController.text,
    );
    try {
      setState(() {
        _isLoading = true;
      });
      await user.reauthenticateWithCredential(credential);
      await user.updatePassword(NewPasswordController.text);
      print('Password Updated');
      setState(() {
        _isLoading = false;
      });
    } catch (error) {
      print(error.toString());
    }
  }
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
        title: Text("Change Password",style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        ),
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
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25,right: 25),
              child: TextField(
                controller: OldPasswordController,
                decoration: InputDecoration(
                    filled: true,
                    hintText: "Old Password",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1)
                    ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25,right: 25),
              child: TextField(
                controller: NewPasswordController,
                decoration: InputDecoration(
                    fillColor:Colors.grey.shade100,
                    filled: true,
                    hintText: "New Password",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1)
                    ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25,right: 25),
              child: TextField(
                controller: ConfirmPasswordController,
                decoration: InputDecoration(
                    fillColor:Colors.grey.shade100,
                    filled: true,
                    hintText: "Confirm Password",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1)
                    ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 30,right: 5,left: 5),
              child:  Center(
                child:TextButton(
                  style: TextButton.styleFrom(backgroundColor: Color(0xff3F48CC
                  ),
                      minimumSize: Size(264, 44),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                  ),
                  onPressed: () {
                    ProfilePsychProfile();
                  },
                  child: Text("Change password",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}