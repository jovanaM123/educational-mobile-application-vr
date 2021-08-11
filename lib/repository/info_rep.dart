
import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

class InfoRepository {
  final FirebaseFirestore _firestore;

  InfoRepository({FirebaseFirestore firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  String username;
  String password;

  Future<void> getUsername() async {
    var document = await _firestore.collection('info').doc("1").get();
    var data =  await document.data();

    username = data['username'];
  }

  Future<void> getPassword() async {
    var document = await _firestore.collection('info').doc("1").get();
    var data =  await document.data();

    password = data['password'];
  }



}