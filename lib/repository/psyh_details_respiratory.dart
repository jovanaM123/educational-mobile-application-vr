import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PsyhDetailsRespiratory {
  final FirebaseFirestore _firestore;

  PsyhDetailsRespiratory({FirebaseFirestore firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  Future<void> createAccount(String firstname, String lastname, String desc, String imgUrl) async {
    String email = await FirebaseAuth.instance.currentUser.email;
    String uid = await FirebaseAuth.instance.currentUser.uid;

    final addUser = await _firestore.collection('psyh_details').doc(uid).set({
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'desc': desc,
      'imgUrl': imgUrl
    });

    return addUser;
  }

  Future<bool> existsUser() async {
    String uid = await FirebaseAuth.instance.currentUser.uid;

    DocumentSnapshot ds = await _firestore.collection("psyh_details").doc(uid).get();
    return ds.exists;
  }

  Future<void> showAllPsyh() async {
    return await _firestore.collection("psyh_details").get();
  }

}