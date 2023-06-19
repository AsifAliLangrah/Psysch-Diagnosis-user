import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'colors.dart';

class LayoutConnectToDoctor extends StatefulWidget {
  final String name;
  final String profile;
  final String providerId;
  const LayoutConnectToDoctor(
      {Key? key,
        required this.name,
        required this.profile,
        required this.providerId})
      : super(key: key);

  @override
  State<LayoutConnectToDoctor> createState() => _LayoutConnectToDoctorState();
}

class _LayoutConnectToDoctorState extends State<LayoutConnectToDoctor> {
  bool _availability = false;

  @override
  Widget build(BuildContext context) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 4),
        child: Card(
          elevation: 3,
          child: ListTile(
            contentPadding: EdgeInsets.all(0),
            leading: Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 5),
              child: CircleAvatar(
                radius: 40,
                backgroundColor: buttonColor,
                backgroundImage: widget.profile != null
                    ? NetworkImage('${widget.profile}')
                    : null,
              ),
            ),
            trailing: OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: buttonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              onPressed: () async {
                setState(() {
                  _availability = !_availability;
                });
                await FirebaseFirestore.instance
                    .collection('admin')
                    .doc(widget.providerId)
                    .update({
                  'connected': _availability
                }).whenComplete(() {
                  final NID = Uuid().v4();
                  FirebaseFirestore.instance.collection("Notification")
                      .doc(NID)
                      .set({
                    "NID": NID,
                    "Message": " User want to connect with you",
                    "userid": FirebaseAuth.instance.currentUser!.uid,
                    "providerId": FirebaseAuth.instance.currentUser!.uid,
                  });
                });
                print('Connected successfully');
              },
              child: Text(
                _availability ? 'Connected' : 'Connect',
                style: buttonText,
              ),
            ),
            title: Text(
              '${widget.name}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
        ),
      );

    }
}