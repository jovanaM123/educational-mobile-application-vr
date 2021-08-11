import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:edu_app/model/Activities.dart';
import 'package:uuid/uuid.dart';

class ChildActivitiesRepository {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _firebaseAuth;
  double averageMinute1;
  double averageMinute2;
  double averageMinute3;
  double bestAverageMinute1;
  double bestAverageMinute2;
  double bestAverageMinute3;

  ChildActivitiesRepository({FirebaseFirestore firestore, FirebaseAuth fireAuth})
    : _firestore = firestore ?? FirebaseFirestore.instance,
    _firebaseAuth = fireAuth ?? FirebaseAuth.instance;


  Future<void> addActivites(int minuteSpend, int grade, int type) async {
    String userEmail =  this.getUsersEmail();
    var uuid = Uuid();
    var id = uuid.v1();

    final addAct = await _firestore.collection('child_activities').doc(id).set({
      'id': id,
      'users_email': userEmail,
      'minute_spend': minuteSpend,
      'grade': grade,
      'typeOfWayAct': type,
      'date_added': DateTime.now()
    });


    return addAct;
  }

  String getUsersEmail() {
    return (_firebaseAuth.currentUser).email;
  }


  Future<List<ChildActivities>> getAllActivities(int type) async {
    String email = this.getUsersEmail();

    final data = await _firestore.collection("child_activities")
        .where("users_email", isEqualTo: email)
        .where("typeOfWayAct", isEqualTo: type)
        .get();


    List<ChildActivities> list = data.docs.map((dataOfEl) {
        return ChildActivities(id: dataOfEl['id'], date_added: dataOfEl['date_added'].toDate(), users_email: email,
            minute_spend: dataOfEl['minute_spend'], grade: dataOfEl['grade'], type: dataOfEl['typeOfWayAct']);
    }).toList();

    return list;
  }

  Future<List<ChildActivities>> getAllBestActivities(int type) async {
    String email = this.getUsersEmail();

   final data = await _firestore.collection("child_activities")
          .where("users_email", isEqualTo: email)
          .where("typeOfWayAct", isEqualTo: type)
          .where("grade", isEqualTo: 5)
          .get();


    List<ChildActivities> list = data.docs.map((dataOfEl) {
      return ChildActivities(id: dataOfEl['id'], date_added: dataOfEl['date_added'].toDate(), users_email: email,
          minute_spend: dataOfEl['minute_spend'], grade: dataOfEl['grade'], type: dataOfEl['typeOfWayAct']);
    }).toList();


    return list;
  }


  Future<void> getAllActivitiesForGraph() async {
    String email = this.getUsersEmail();

    final data = await _firestore.collection("child_activities")
        .where("users_email", isEqualTo: email)
        .get();

    return data;
  }


  Future<void> getAverageTimeInSS(int type) async {
    List<ChildActivities> _activities = await getAllActivities(type);

    if(_activities.length == 0) {
      if(type == 1) {
        averageMinute1 = 30;
      } else if (type == 2) {
        averageMinute2 = 30;
      } else {
        averageMinute3 = 30;
      }
    } else {
      int countElements = _activities.length;
      int minutes = 0;

      await _activities.forEach((element) {
        minutes += element.minute_spend;
      });

      if(type == 1) {
        averageMinute1 = minutes == 0 ? 30 : minutes / countElements;
      } else if (type == 2) {
        averageMinute2 = minutes == 0 ? 30 : minutes / countElements;
      } else {
        averageMinute3 = minutes == 0 ? 30 : minutes / countElements;
      }

    }
  }

  Future<void> getBestTimeInSS(int type) async {
    List<ChildActivities> _activities = await getAllBestActivities(type);

    if(_activities.length == 0) {
      if(type == 1) {
        bestAverageMinute1 = 30;
      } else if (type == 2) {
        bestAverageMinute2 = 30;
      } else {
        bestAverageMinute3 = 30;
      }
    } else {
      int countElements = _activities.length;
      int minutes = 0;

     await _activities.forEach((element) {
        minutes += element.minute_spend;
      });

      if(type == 1) {
        bestAverageMinute1 = minutes == 0 ? 30 : minutes / countElements;
      } else if (type == 2) {
        bestAverageMinute2 = minutes == 0 ? 30 : minutes / countElements;
      } else {
        bestAverageMinute3 = minutes == 0 ? 30 : minutes / countElements;
      }
    }
  }

}