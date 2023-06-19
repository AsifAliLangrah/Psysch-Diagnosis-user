import 'package:flutter/material.dart';
import 'package:psych_diagnosis/Home.dart';
import 'colors.dart';

class PositiveReview extends StatefulWidget {
  final String diseaseName;

  PositiveReview({required this.diseaseName});

  @override
  State<PositiveReview> createState() => _PositiveReviewState();
}

class _PositiveReviewState extends State<PositiveReview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/result.png'),
          Container(
            margin: EdgeInsets.all(20),
            child: Text(
              'You are showing signs related to "${widget.diseaseName}". Please see a psychiatric provider or doctor to get the additional help or support you may need.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.30,
            child: Container(
              margin: EdgeInsets.only(top: 50),
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => PsychHome()),
                  );
                },
                color: buttonColor,
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: isloading
                    ? CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                )
                    : Text(
                  'Back to Home',
                  style: buttonText,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool isloading = false;
}
