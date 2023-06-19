import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'Negative Screen.dart';
import 'Result screen.dart';
import 'colors.dart';
import 'layoutsection.dart';

int totalQuestion = 0;

class ScreenPsychSection1 extends StatefulWidget {
  final String diseaseId;
  final String disease;
  final String adminId;
  final minimumYes;
  final sectionCount;
  final totalNo;
  final totalYes;

  const ScreenPsychSection1({
    required this.diseaseId,
    required this.disease,
    required this.adminId,
    required this.minimumYes,
    required this.sectionCount,
    required this.totalNo,
    required this.totalYes,
  });

  @override
  State<ScreenPsychSection1> createState() => _ScreenPsychSection1State();
}

class _ScreenPsychSection1State extends State<ScreenPsychSection1> {
  bool isButtonPressed = false;

  @override
  void initState() {
    totalQuestion = 0;
    super.initState();
  }

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
          style: appbarStyle,
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
              builder: (
                  context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot,
                  ) {
                if (!snapshot.hasData) {
                  return Center(
                    child: Text("Question Doesn't Exist"),
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: buttonColor,
                    ),
                  );
                }
                totalQuestion = snapshot.data!.docs.length;
                return ListView.builder(
                  itemCount: snapshot.data?.docs.length ?? 0,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (
                      BuildContext context,
                      int index,
                      ) {
                    questionId = snapshot.data?.docs[index]['questionId'];
                    return LayoutPsychSection(
                      totalYes: widget.totalYes,
                      totalNo: widget.totalNo,
                      sectionCount: widget.sectionCount,
                      totalQuestion: totalQuestion,
                      question: snapshot.data?.docs[index]['question'],
                      questionId: questionId,
                      diseaseId: widget.diseaseId,
                      adminId: widget.adminId,
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
                } else if (numYesAns > numNoAns) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PositiveReview(diseaseName: widget.disease),
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

                setState(() {
                  isButtonPressed = true;
                });
              },
              color: isButtonPressed ? Colors.blueAccent : Color(0xff3F48CC),
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: isButtonPressed
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


