import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edu_app/model/Appoinment.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

class AddApoinmentyRepository {
  final FirebaseFirestore _firestore;

  AddApoinmentyRepository({FirebaseFirestore firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  //0 - ne prihvacen jos
  // 1 - prihvacen

  Future<void> addApoinment(String drEmail, String dateOfAp) async {
    String email = await FirebaseAuth.instance.currentUser.email;
    var uuid = Uuid();
    var id = uuid.v1();

    final addUser = await _firestore.collection('appoinments').doc(id).set({
      'id': id,
      'user_email': email,
      'date_of_ap': dateOfAp,
      'dr_email': drEmail,
      'accepted': 0,
    });

    return addUser;
  }

  Future<List<Appoinment>> showAllAppOfUser() async {
    String email = await FirebaseAuth.instance.currentUser.email;

    final data = await _firestore.collection("appoinments")
        .where("user_email", isEqualTo: email)
        .where("accepted", isEqualTo: 1)
        .get();

    List<Appoinment> list = data.docs.map((dataOfEl) {
      DateTime now = new DateTime.now();
      DateTime parsedDate = DateTime.parse(dataOfEl['date_of_ap']);

      if (now.isBefore(parsedDate)) {
        return Appoinment(id: dataOfEl['id'], dr_email: dataOfEl['dr_email'],
            user_email: dataOfEl['user_email'], date_of_ap: dataOfEl['date_of_ap']);
      }
    }).toList();

    list.removeWhere((value) => value == null);

    return list;
  }

  Future<bool> isReserved(String date, String drEmail) async {
    String email = await FirebaseAuth.instance.currentUser.email;

    final doc1 = await _firestore.collection("appoinments")
        .where("user_email", isEqualTo: email)
        .where("date_of_ap", isEqualTo: date)
        .where("dr_email", isEqualTo: drEmail)
        .get();

    final doc2 = await _firestore.collection("appoinments")
        .where("user_email", isEqualTo: email)
        .where("date_of_ap", isEqualTo: date)
        .get();

    var data1 =  await doc1.docs;
    var data2 =  await doc2.docs;

    return (data1.isEmpty || data2.isEmpty) ? false : true;
  }

  Future<List<Appoinment>> showAllApp(int accepted) async {
    String email = await FirebaseAuth.instance.currentUser.email;

    final data = await _firestore.collection("appoinments")
        .where("dr_email", isEqualTo: email)
        .where("accepted", isEqualTo: accepted)
        .get();

    List<Appoinment> list = data.docs.map((dataOfEl) {
      DateTime now = new DateTime.now();
      DateTime parsedDate = DateTime.parse(dataOfEl['date_of_ap']);

      if (now.isBefore(parsedDate)) {
        return Appoinment(id: dataOfEl['id'], dr_email: dataOfEl['dr_email'],
            user_email: dataOfEl['user_email'], date_of_ap: dataOfEl['date_of_ap']);
      }
    }).toList();

    list.removeWhere((value) => value == null);

    return list;
  }

  Future<void> manageApoinment(String id, int type) async {
    if (type == 1) {
      return await _firestore.collection('appoinments').doc(id).update({
        'accepted': 1,
      });
    } else if (type == 2) {
      return await _firestore.collection('appoinments').doc(id).delete();
    }
  }

}