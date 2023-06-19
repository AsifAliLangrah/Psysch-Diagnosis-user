// import 'package:flutter/material.dart';
// class MajorDepressiveOrder extends StatefulWidget {
//   const MajorDepressiveOrder({Key? key}) : super(key: key);
//
//   @override
//   State<MajorDepressiveOrder> createState() => _MajorDepressiveOrderState();
// }
// bool isYesSelected = false;
// int selectedIndex = -1;
// class _MajorDepressiveOrderState extends State<MajorDepressiveOrder> {
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
//         title: Text("Section 1",style: TextStyle(
//           fontWeight: FontWeight.w600,
//           fontSize: 20,
//           color: Colors.black,
//         ),),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             GestureDetector(
//               onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (_) {
//                   return MajorDepressiveOrder();
//                 }));
//               },
//               child: Container(
//                 height: 700,
//                 child: ListView.builder(
//                   itemCount: 15,
//                   itemBuilder: (BuildContext context, int index) {
//                     bool isYesPressed = false;
//                     bool isNoPressed = false;
//                     return Padding(
//                       padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
//                       child: Container(
//                         width: 400,
//                         height: 150,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(4),
//                             color: Colors.white,
//                             boxShadow: [
//                               BoxShadow(color: Colors.black, blurRadius: 1),
//                             ]),
//                         child: Column(
//                           children: [
//                             SizedBox(height: 25),
//                             Center(
//                               child: Text(
//                                 "Did you feel sad or depressed?",
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w600,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                             ),
//                             SizedBox(height: 25),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 TextButton(
//                                   style: TextButton.styleFrom(
//                                     backgroundColor: selectedIndex == index
//                                         ? Color(0xfff3F48CC)
//                                         : Color(0xfffEBEBEB),
//                                     minimumSize: Size(74, 35),
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(25),
//                                     ),
//                                   ),
//                                   onPressed: () {
//                                     setState(() {
//                                       selectedIndex = index;
//                                     });
//                                   },
//                                   child: Text(
//                                     "Yes",
//                                     style: TextStyle(
//                                       color: Colors.black,
//                                       fontWeight: FontWeight.w700,
//                                       fontSize: 18,
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(width: 10),
//                                 TextButton(
//                                   style: TextButton.styleFrom(
//                                     backgroundColor: selectedIndex == index
//                                         ? Color(0xfffEBEBEB)
//                                         : Color(0xfff3F48CC),
//                                     minimumSize: Size(74, 35),
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(25),
//                                     ),
//                                   ),
//                                   onPressed: () {
//                                     setState(() {
//                                       selectedIndex = index;
//                                     });
//                                   },
//                                   child: Text(
//                                     "No",
//                                     style: TextStyle(
//                                       color: Colors.black,
//                                       fontWeight: FontWeight.w700,
//                                       fontSize: 18,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//
//             ),
//             ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:psych_diagnosis/Negative%20Screen.dart';
import 'package:psych_diagnosis/Result%20screen.dart';

import 'package:psych_diagnosis/main.dart';

int totalQuestion = 0;
class ScreenPsychSection1 extends StatefulWidget {
  final String diseaseId;
  final String disease;
  final String adminId;
  final minimumYes;
  final sectionCount;
  final totalNo;
  final totalYes;
  // final sum1;
  // final sum2;

  const ScreenPsychSection1({
    required this.diseaseId,
    required this.disease,
    required this.adminId,
    // required this.sum1,
    // required this.sum2,
    required this.minimumYes,
    required this.sectionCount,
    required this.totalNo,
    required this.totalYes,
  });

  @override
  State<ScreenPsychSection1> createState() => _ScreenPsychSection1State();
}

class _ScreenPsychSection1State extends State<ScreenPsychSection1> {
  @override
  void initState() {
    totalQuestion = 0;
    super.initState();
  }

  bool isloading = false;

  var questionId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context, questionId);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: Text(
          'Section ${widget.sectionCount}',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('question')
                  .where('diseaseId', isEqualTo: widget.diseaseId)
                  .snapshots(),
              builder: (context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: Text("Question Doesn't Exist"),
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  );
                }
                totalQuestion = snapshot.data!.docs.length;
                return ListView.builder(
                  itemCount: snapshot.data?.docs.length ?? 0,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    questionId = snapshot.data?.docs[index]['questionId'];
                    return MajorDepressiveOrder(
                      totalYes: widget.totalYes,
                      totalNo: widget.totalNo,
                      sectionCount: widget.sectionCount,
                      totalQuestion: totalQuestion,
                      question: snapshot.data?.docs[index]['question'],
                      questionId: questionId,
                      diseaseId: widget.diseaseId,
                      adminId: widget.adminId, minimumYes: '', disease: '',
                    );
                  },
                );
              },
            ),
          ),
          SizedBox(
            height: 43,
            width: (MediaQuery.of(context).size.width / 1.30).toDouble(),
            child: MaterialButton(
              onPressed: () {
                if (numYesAns == 0 && numNoAns == 0) {
                  print('Please give the Question Answers');
                } else
                if (numYesAns > numNoAns) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PositiveReview(diseaseName:widget.disease),
                    ),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => NegativeReview(diseaseName: widget.disease),
                    ),
                  );
                }
              },
              color: Color(0xff3F48CC),
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: isloading
                  ? Container(
                height: 27,
                width: 27,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
                  : Text(
                "Submit",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

int numNoAns = 0;
int numYesAns = 0;

class  MajorDepressiveOrder extends StatefulWidget {
  final String diseaseId;
  final String question;
  final String questionId;
  final sectionCount;
  final String adminId;
  final totalNo;
  final totalYes;
  final totalQuestion;
  const  MajorDepressiveOrder({
    Key? key,
    required this.question,
    required this.diseaseId,
    required this.questionId,
    required this.adminId,
    this.totalQuestion,
    required this.sectionCount,
    required this.totalNo,
    required this.totalYes, required disease, required minimumYes,
    // this.sum1,
    // this.sum2
  }) : super(key: key);

  @override
  State< MajorDepressiveOrder> createState() => _LayoutPsychSectionState();
}

class _LayoutPsychSectionState extends State< MajorDepressiveOrder> {
  int numQuestions = 0;
  var currentIndex = 0;
  var index = 0;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.02,
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 2,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                textAlign: TextAlign.center,
                '${widget.question}',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color:Colors.black,
                    ),
                    backgroundColor:
                     Colors.white,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: () {
                    setState(
                          () {
                        saveAnswerToFirestore(
                            widget.diseaseId, widget.questionId, "No");
                        getPreviousAnswer(widget.diseaseId, widget.questionId);
                        // navigator();
                        currentIndex = 1;
                        index = 1;
                      },
                    );
                  },
                  child: Text(
                    'No',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: currentIndex == 1 ? Colors.white : Colors.blueAccent,
                    ),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.blueAccent),
                    backgroundColor:
                    currentIndex == 2 ? Colors.blueAccent : Colors.white,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: () {
                    setState(
                          () {
                        saveAnswerToFirestore(
                            widget.diseaseId, widget.questionId, "Yes");
                        getPreviousAnswer(widget.diseaseId, widget.questionId);
                        currentIndex = 2;
                        index = 2;
                      },
                    );
                  },
                  child: Text(
                    'yes',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: currentIndex == 2 ? Colors.white : Colors.blueAccent,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> saveAnswerToFirestore(
      String uid, String questionId, String answer) async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection("user_answers")
        .doc(FirebaseAuth.instance.currentUser!.uid +
        "_" +
        uid +
        "_" +
        questionId)
        .get();

    if (snapshot.exists) {
      String previousAnswer = snapshot.get("answer");
      if (previousAnswer == "Yes") {
        numYesAns--;
      } else if (previousAnswer == "No") {
        numNoAns--;
      }
    }

    if (answer == "Yes") {
      numYesAns++;
    } else if (answer == "No") {
      numNoAns++;
    }

    await FirebaseFirestore.instance
        .collection("user_answers")
        .doc(FirebaseAuth.instance.currentUser!.uid +
        "_" +
        uid +
        "_" +
        questionId)
        .set(
      {
        "answer": answer,
        'userId': FirebaseAuth.instance.currentUser!.uid,
        'questionId': widget.questionId,
        'question': widget.question,
        'diseaseId': widget.diseaseId,
        //'total': totalQuestion,
        'sectionCount': widget.sectionCount,
        'adminId': widget.adminId,
        'totalYes': widget.totalYes,
        'totalNo': widget.totalNo,
      },
    );
  }

  Future<String?> getPreviousAnswer(String uid, String questionId) async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection("user_answers")
        .doc(FirebaseAuth.instance.currentUser!.uid +
        "_" +
        uid +
        "_" +
        questionId)
        .get();
    if (snapshot.exists) {
      String? answer = snapshot.get("answer");
      if (answer == 'Yes') {
        numYesAns++;
      } else if (answer == 'No') {
        numNoAns++;
      }
      return answer;
    } else {
      setState(() {
        numQuestions++;
      });
      return null;
    }
  }

  @override
  void initState() {
    numNoAns = 0;
    numYesAns = 0;
    super.initState();
    currentIndex = index;
    getPreviousAnswer(widget.diseaseId, widget.questionId).then(
          (answer) {
        if (answer != null) {
          setState(
                () {
              print(',,,,,,,,, $numYesAns');
              print('object     $numNoAns');
              currentIndex = answer == 'Yes' ? 2 : 1;
              index = currentIndex;
            },
          );
        }
      },
    );
  }
}
