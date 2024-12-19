// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core_web/firebase_core_web.dart';
import 'package:firebase_auth_web/firebase_auth_web.dart';
import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart';
import 'package:cloud_firestore_web/cloud_firestore_web.dart';
import 'package:cloud_firestore_platform_interface/cloud_firestore_platform_interface.dart';

Future<dynamic> getEventsAction() async {
  // Add your function code here!
  var today = DateTime.now();
  var yesterday = today.subtract(Duration(days: 1));
  var tomorrow = today.add(Duration(days: 1));
  var nextDay = today.add(Duration(days: 2));

  var colors = {
    'work': '#BAB4F9', // purple
    'health': '#BCF0EA', // green
    'personal': '#F7CAB6', // orange
    'meals': '#FFADB3', // pink
    'travel': '#D0D7DC', // grey
  };

  var events = <String, dynamic>{'events': []};

//   var events = {
//     'events': [
//       // Yesterday
//       {
//         'title': '✈️ Sunita is so pretty',
//         'visible': true,
//         'start_time': DateFormat("yyyy-MM-dd HH:mm:ss").format(
//             DateTime(yesterday.year, yesterday.month, yesterday.day, 3, 0)),
//         'end_time': DateFormat("yyyy-MM-dd HH:mm:ss").format(
//             DateTime(yesterday.year, yesterday.month, yesterday.day, 15, 0)),
//         'description':
//             'Lufthansa flight 8621\nDeparting Munich MUC airport\nTerminal 2; Gate 21D',
//         'location': 'MUC Airport',
//         'alert': '2 hours before',
//         'color': colors['health'],
//       },
// // Next day
//       {
//         'title': '✈️ Flight to SF',
//         'visible': true,
//         'start_time': DateFormat("yyyy-MM-dd HH:mm:ss")
//             .format(DateTime(nextDay.year, nextDay.month, nextDay.day, 6, 5)),
//         'end_time': DateFormat("yyyy-MM-dd HH:mm:ss")
//             .format(DateTime(nextDay.year, nextDay.month, nextDay.day, 18, 35)),
//         'description':
//             'Lufthansa flight 44\nDeparting San Francisco SFO airport\nTerminal B; Gate 50',
//         'location': 'SFO Airport',
//         'alert': '2 hours before',
//         'color': colors['travel'],
//         'type': 'Personal',
//       }
//     ] // END OF EVENTS
//   };

//COPY PASTE END --> BELOW IS MY STUFF

  final uid = FirebaseAuth.instance.currentUser?.uid;
  var data = await FirebaseFirestore.instance
      .collection('users')
      .doc(uid)
      .collection('events')
      .get()
      .then((QuerySnapshot querySnapshot) {
    querySnapshot.docs.forEach((doc) {
      Timestamp s = doc['startTime'] as Timestamp;
      Timestamp e = doc['endTime'] as Timestamp;
      DateTime start = s.toDate();
      DateTime end = e.toDate();
      //var doc_id = doc.id; Works but is string, not doc reference
      DocumentReference docRef = doc.reference;
      var docId = docRef.id;
      var collectionPath = docRef.parent.path;
      events['events']?.add({
        'title': doc["title"],
        'visible': true,
        'start_time': DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime(
            start.year, start.month, start.day, start.hour, start.minute)),
        'end_time': DateFormat("yyyy-MM-dd HH:mm:ss").format(
            DateTime(end.year, end.month, end.day, end.hour, end.minute)),
        'description': doc['description'],
        'color': doc['color'],
        'type': doc['type'],
        'docId': docId,
        'path': collectionPath,
        // 'start_time':
        //     DateFormat("yyyy-MM-dd HH:mm:ss").format(doc["startTime"]),
        // 'end_time': DateFormat("yyyy-MM-dd HH:mm:ss").format(doc["endTime"]),
        // 'description': doc["description"],
        // 'location': 'SFO Airport',
        // 'alert': '2 hours before',
        // 'color': doc["color"],
      });
    });
  });

  //Final statement
  return events;
}
