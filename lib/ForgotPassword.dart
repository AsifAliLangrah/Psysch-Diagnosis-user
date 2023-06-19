import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:psych_diagnosis/Login.dart';
class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);
  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}
class _ForgotPasswordState extends State<ForgotPassword> {
  var verificationId;
  final emailController = TextEditingController();
  final auth = FirebaseAuth.instance ;
  @override
   Widget build(BuildContext context) {
  //   var height= MediaQuery.of(context).size.height;
  //   var width= MediaQuery.of(context).size.width;
    return  Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text
                  ("Forgot Password",style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                padding: EdgeInsets.only(left: 15),
               // height: height*0.020,
               // width: width*0.80,
                child: Text("Enter your email to recover your password ",style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(padding: EdgeInsets.only(left: 25,right: 25,top: 40),
                child: Container(
                  width: 350,
                  height: 43,
                  child: Material(
                    elevation: 1,
                    shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(100)),
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: "Email",
                        contentPadding: EdgeInsets.only(
                            left: 16.0, right: 16.0, bottom: 8.0),
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Color(0xffAAAAAA),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(top: 100,right: 5,left: 5),
                child:  Center(
                  child:TextButton(
                    style: TextButton.styleFrom(backgroundColor: Color(0xff3F48CC),
                        minimumSize: Size(264, 44),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                    ),
                    onPressed: (){
                      FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text.toString()).then((value) {
                        Utlis().toastMessage('We have a recover password please check email ');
                      }).onError((error, stackTrace){
                        Utlis().toastMessage(error.toString());
                      });
                      Navigator.push(context, MaterialPageRoute(builder: (_){
                        return Login();
                      }));
                    },
                    child: Text("Send",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        fontFamily:'Aref Ruqaa',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class VerificationScreeenId {
}
class Utlis {
  void toastMessage(String s) {}
}
class Verification {
}
