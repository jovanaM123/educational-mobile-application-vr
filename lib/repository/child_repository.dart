import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

class ChildRepository {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _firebaseAuth;

  ChildRepository({FirebaseFirestore firestore, FirebaseAuth fauth})
      : _firestore = firestore ?? FirebaseFirestore.instance,
       _firebaseAuth = fauth ?? FirebaseAuth.instance;


  Future<void> addInfo(String name, String dateOfBirth, String gender) async {
    var uuid = Uuid();
    var id = uuid.v1();

    final addUser = await _firestore.collection('child_details').doc(id).set({
      'id': id,
      'name': name,
      'month_of_child': dateOfBirth,
      'gender': gender,
      'date_added': DateTime.now(),
    });

    return addUser;
  }

  String getUserEmail() {
    return (_firebaseAuth.currentUser).email;
  }

}