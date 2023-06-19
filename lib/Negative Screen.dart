//import 'package:flutter/material.dart';

// import 'Result screen.dart';
//
// class NegativeScreen extends StatefulWidget {
//   const NegativeScreen({Key? key}) : super(key: key);
//
//   @override
//   State<NegativeScreen> createState() => _NegativeScreenState();
// }
//
// class _NegativeScreenState extends State<NegativeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Container(
//             child: Center(
//            child:   Image.asset("assets/image/Negative.png"),
//             ),
//           ),
//           Container(
//             child:  Text("Congratulations, You are not showing signs related to Major Depressive disorder. Take care and thank you for using Psych Diagnosis app.",
//             style: TextStyle(
//               fontSize: 15,
//               fontFamily: 'Segoe UI',
//               fontWeight: FontWeight.w400,
//             ),
//             ) ,
//           ),
//           SizedBox(
//             height: 50,
//           ),
//           Container(
//             child: TextButton(
//               onPressed: (){
//                 Navigator.push(context, MaterialPageRoute(builder: (_){
//                   return ResultScreen();
//                 }));
//               },
//               child: Text(
//                 'Back Home'
//               ),
//             )
//           )
//
//         ],
//       )
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:psych_diagnosis/Home.dart';

class NegativeReview extends StatefulWidget {
  final String diseaseName;

  const NegativeReview({Key? key, required this.diseaseName}) : super(key: key);

  @override
  State<NegativeReview> createState() => _NegativeReviewState();
}

class _NegativeReviewState extends State<NegativeReview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/Negative.png'),
          SizedBox(height: 30),
          Container(
            margin: EdgeInsets.all(20),
            alignment: Alignment.center,
            child: RichText(
              text: TextSpan(
                text: 'Congratulations, ',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text:
                    'You are not showing signs related to ${widget.diseaseName}. Take care and thank you for using Psych Diagnosis app.',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 50),
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.30,
            child: Container(
              margin: EdgeInsets.only(top: 30),
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => PsychHome()),
                  );
                },
                color: Color(0xff3F48CC),
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
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
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
