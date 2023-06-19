import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:psych_diagnosis/Home.dart';
import 'package:psych_diagnosis/Sigup.dart';
import 'ForgotPassword.dart';
import 'colors.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  State<Login> createState() => _LoginState();
}
bool _passwordVisible = false;
bool _obscureText = true;
class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    emailController.clear();
    passwordController.clear();
    try {
      if (email == "" || password == "") {
        print("Please fill in all the fields");
      } else {
        // Set loading state
        setState(() {
          isLoading = true;
        });
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        if (userCredential.user != null) {
          Navigator.push(
            context,
            CupertinoPageRoute(builder: (context) => PsychHome()),
          );
        }
        // Reset loading state
        setState(() {
          isLoading = false;
        });
      }
    } on FirebaseAuthException catch (ex) {
      print(ex.code.toString());
      // Reset loading state
      setState(() {
        isLoading = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Login',
          style: appbarStyle,
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.asset("assets/images/Logo.png",
              height: 121,
              width: 135),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Welcome back!',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
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
                    // validator: (value) {
                    //   if (value!.isEmpty) {
                    //     return "Email Required";
                    //   } else
                    //     return null;
                    // },
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.30,
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextFormField(
                    obscureText: _obscureText,
                    cursorColor: buttonColor,
                    controller: passwordController,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: buttonColor,
                        ),
                      ),
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
                      hintText: 'Password',
                      hintStyle: textFieldStyle,
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                    textAlign: TextAlign.left,
                    textAlignVertical: TextAlignVertical.center,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.30,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_){
                        return ForgotPassword();
                      }));
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(top: 40,right: 5,left: 5),
                child:  Center(
                  child:TextButton(
                    style: TextButton.styleFrom(backgroundColor: Color(0xff3F48CC),
                        minimumSize: Size(264, 43),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                    ),
                    onPressed: () {
                      setState(() {
                        isLoading = true;
                      });
                      login();
                    },
                    child: Text("Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        fontFamily: 'Aref Ruqaa'
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(),
                      child: Text("Do not have an account?"),
                    ),
                    TextButton(   onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_){
                        return Signup();
                      }
                      ),
                      );
                    } ,
                    child: Text("Sign UP",style: TextStyle(
                      color: Color(0xff3F48CC),
                      fontSize: 16,
                    ),
                    ),
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
bool isLoading = false;

