import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'ForgotPassword.dart';
import 'creat profile.dart';
class VerificationSacreeen extends StatefulWidget {
  final FirstName;
  final LastName;
  final Email;
  final Password;
  final CPassword;

  const VerificationSacreeen(
      {super.key,
      required this.FirstName,
      required this.LastName,
      required this.Email,
      required this.Password,
      required this.CPassword});

  @override
  State<VerificationSacreeen> createState() => _VerificationSacreeenState();
}
class _VerificationSacreeenState extends State<VerificationSacreeen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _otpTextController =
      TextEditingController(text: '');
  String savedOTP = '';
  @override
  void initState() {
    // TODO: implement initState
    print(widget.FirstName);
    print(widget.Email);
    sendOtpCode();
    print("OTP send");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(children: [
            Padding(
              padding: EdgeInsets.only(top: 40),
              child: Text(
                "Verification",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
             // padding: EdgeInsets.only(left: 15),
              // height: height*0.020,
              // width: width*0.80,
              child: Text(
                "Enter the OTP code sent to your email  ",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 40,
            ),
            Pinput(
              textInputAction: TextInputAction.next,
              controller: _otpTextController,
              keyboardType: TextInputType.number,
              length: 4,
              obscureText: false,
              closeKeyboardWhenCompleted: true,
              defaultPinTheme: PinTheme(
                margin: EdgeInsets.all(8),
                height: 45,
                width: 45,
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff6F6F6F),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 2,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
              onTap: () {
                loadValue("otp2");
              },
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Container(
                  child: Text(
                    'Did not Receive a Code?',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        fontFamily: 'Open Sans'),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return ForgotPassword();
                    }));
                  },
                  child: Text(
                    'RESEND',
                    style: TextStyle(
                      fontFamily: 'Open Sans',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 70, right: 5, left: 5),
              child: Center(
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xff3F48CC),
                    minimumSize: Size(156, 44),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  onPressed: () {
                    loadValue("otp2");
                    if (_otpTextController.text == '') {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('please fill otp'),
                        ),
                      );
                    } else if (_otpTextController.text == savedOTP) {
                      _UploadDataToFirebase();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Otp can,t be matched'),
                        ),
                      );
                    }
                  },
                  child: Text(
                    "Done",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
           ]
          ),
        ),
      ),
    );
  }

  void _UploadDataToFirebase() async {
    showProgressindicator();
    try {
      await _auth.createUserWithEmailAndPassword(
        email: widget.Email.toString().trim(),
        password: widget.Password.toString().trim(),
      );
      final User? user = _auth.currentUser;
      final uid = user!.uid;
      FirebaseFirestore.instance.collection('user').doc(uid).set({
        'userid': uid,
        'firstName': widget.FirstName,
        'LastName': widget.LastName,
        'email': widget.Email,
        'password': widget.Password,
        'cPassword': widget.CPassword,
      }).then((value) => {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return ScreenPsychCompleteProfile(uid: uid);
            }))
          });
      // Navigator.canPop(context) ? Navigator.pop(context) : null;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }
  void showProgressindicator() {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(
            color: Color(0xff3F48CC),
          ),
        );
      },
    );
  }
  Future<void> sendOtpCode() async {
    String otp = generateOTP();
    Map<String, String> body = {
      'to': widget.Email,
      'message': "Hey " +
          "${widget.FirstName} ${widget.LastName}" +
          ", you're almost ready to start enjoying Psych Diagnosis . Simply Copy this code " +
          otp +
          " and paste in your  App for signup completion ",
      'subject': 'Psych Diagnosis'
    };
    final response = await http.post(
        Uri.parse(
            "https://apis.appistaan.com/mailapi/index.php?key=sk286292djd926d"),
        body: body);
    print(response);
    if (response.statusCode == 200) {
      saveValue('otp2', otp);
      print(otp);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('otp send successfully')),
      );
    }
  }

  Future<void> saveValue(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  // Method to load the value from shared preferences
  Future<void> loadValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      savedOTP = prefs.getString(key)!;
      print(savedOTP);
    });
  }

  String generateOTP() {
    int length = 4; // Length of the OTP
    String characters = '0123456789'; // Characters to use for the OTP
    String otp = '';
    for (int i = 0; i < length; i++) {
      otp += characters[Random().nextInt(characters.length)];
    }
    return otp;
  }
}
