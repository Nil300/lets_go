import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class crudMedthod {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final Firestore _firestore = Firestore.instance;

  Future<String> getCurrentUID() async {
    return (await _firebaseAuth.currentUser()).uid;
  }

  getData() async {
    final uid = await getCurrentUID();
    return await Firestore.instance
        .collection('userData')
        .document(uid)
        .collection('testingData')
        .getDocuments();
  }
//  bool isLoggedIn() {
//    if (FirebaseAuth.instance.currentUser() != null) {
//      return true;
//    } else {
//      return false;
//    }
//  }

//  Future<void> addData(carData) async {
////    if (isLoggedIn()) {
////      Firestore.instance.collection('testcrud').add(carData).catchError((e) {
////        print(e);
////      });
////    } else {
////      print('You need to be logged in');
////    }
////  }

}
