import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  final FirebaseAuth _firebaseAuth;

  UserRepository({FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  Future<void> signInWIthCredentials(String email, String pass) async {
    return _firebaseAuth.signInWithEmailAndPassword(email: email, password: pass);
  }

  Future<void> signOut() async {
    return Future.wait([
      _firebaseAuth.signOut()
    ]);
  }

  Future<void> signUp(String email, String pass, int type) async {
    final signup =  await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: pass);

    //add to user; type 1 - user; type 2 - psyh;
    String uid = FirebaseAuth.instance.currentUser.uid;
    await FirebaseFirestore.instance.collection('users_type').doc(uid).set({
      'type': type
    });

   return signup;
  }

  Future<bool> isSignedIn() async {
    return (await _firebaseAuth.currentUser) != null;
  }

  Future<String> getUser() async {
    return (await _firebaseAuth.currentUser).email;
  }

  int type;

  Future<void> isAuthicated() async {
    String uid = await FirebaseAuth.instance.currentUser.uid;

    var document = await FirebaseFirestore.instance.collection('users_type').doc(uid).get();
    var data =  await document.data();

    type = data['password'];
  }

}