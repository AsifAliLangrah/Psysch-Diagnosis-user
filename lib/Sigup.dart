import 'package:flutter/material.dart';
import 'Login.dart';
import 'Verification.dart';
import 'colors.dart';

  class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);
  @override
  State<Signup> createState() => _SignupState();
  }
bool _passwordVisible = false;
bool obscureText = true;
bool _obscureText = true;
  class _SignupState extends State<Signup> {
  TextEditingController nameController =TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cPasswordController = TextEditingController();
  var recordNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Signup',
          style: appbarStyle,
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/Logo.png",
              height: 121,
              width: 135,),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Let’s Get It Started!",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                  ),
                ),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     Text("Creat an account to get all features",style: TextStyle(
              //       fontWeight: FontWeight.w400,
              //       fontSize: 17,
              //     ),),
              //   ],
              // ),
              // SizedBox(
              //   height: 40,
              // ),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 20,
                ),
                width: MediaQuery.of(context).size.width / 1.30,
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextFormField(
                    cursorColor: buttonColor,
                    controller: nameController,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: buttonColor,
                        ),
                      ),
                      contentPadding: EdgeInsets.only(
                        left: 10,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'First Name',
                      hintStyle: textFieldStyle,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "First Name Required";
                      } else
                        return null;
                    },
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.30,
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextFormField(
                    cursorColor: buttonColor,
                    controller: lNameController,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: buttonColor,
                        ),
                      ),
                      contentPadding: EdgeInsets.only(
                        left: 10,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'Last Name',
                      hintStyle: textFieldStyle,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Last Name Required";
                      } else
                        return null;
                    },
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 20,
                ),
                width: MediaQuery.of(context).size.width / 1.30,
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextFormField(
                    cursorColor: buttonColor,
                    controller: recordNumber,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: buttonColor,
                        ),
                      ),
                      contentPadding: EdgeInsets.only(
                        left: 10,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'Medical Record Number (Optional)',
                      hintStyle: textFieldStyle,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Medical Required Required";
                      } else
                        return null;
                    },
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 20,
                ),
                width: MediaQuery.of(context).size.width / 1.30,
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextFormField(
                    cursorColor: buttonColor,
                    controller: emailController,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: buttonColor,
                        ),
                      ),
                      contentPadding: EdgeInsets.only(
                        left: 10,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'Email',
                      hintStyle: textFieldStyle,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Email Required";
                      } else
                        return null;
                    },
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.30,
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextFormField(
                    cursorColor: buttonColor,
                    controller: passwordController,
                    obscureText: obscureText,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: buttonColor,
                        ),
                      ),
                      hintText: 'Password',
                      hintStyle: textFieldStyle,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            obscureText = !obscureText;
                          });
                        },
                        child: Icon(
                          obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: buttonColor,
                        ),
                      ),
                      contentPadding: EdgeInsets.only(
                          left: 15, top: 15, right: 15, bottom: 15),
                      alignLabelWithHint: true,
                      labelStyle: TextStyle(color: Colors.blue),
                      border:
                      OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                    textAlign: TextAlign.left,
                    textAlignVertical: TextAlignVertical.center,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 20,
                ),
                width: MediaQuery.of(context).size.width / 1.30,
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextFormField(
                    cursorColor: buttonColor,
                    controller: cPasswordController,
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: buttonColor,
                        ),
                      ),
                      hintText: 'Confirm Password',
                      hintStyle: textFieldStyle,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        child: Icon(
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: buttonColor,
                        ),
                      ),
                      contentPadding: EdgeInsets.only(
                          left: 15, top: 15, right: 15, bottom: 15),
                      alignLabelWithHint: true,
                      labelStyle: TextStyle(color: Colors.blue),
                      border:
                      OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                    textAlign: TextAlign.left,
                    textAlignVertical: TextAlignVertical.center,
                  ),
                ),
              ),

              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(top: 25,right: 5,left: 5),
                child:  Center(
                  child:TextButton(
                    style: TextButton.styleFrom(backgroundColor: Color(0xff3F48CC
                    ),
                        minimumSize: Size(264, 44),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                    ),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_){
                        return  VerificationSacreeen(
                          FirstName  : nameController.text,
                          LastName   : lNameController.text,
                          Email      : emailController.text,
                          Password   : passwordController.text,
                          CPassword  : cPasswordController.text,
                        );
                      }));
                    },
                    child: Text("SignUp",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(),
                      child: Text("Already have an account?"),
                    ),
                    TextButton(   onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_){
                        return Login();
                      }));
                      },
                      child: Text("Login",style: TextStyle(
                      color: Color(0xff3F48CC),
                      fontSize: 16,
                    ),),
                    ),
                  ]
              ),
            ],
          ),
        ),
      ),
    );
  }
}
