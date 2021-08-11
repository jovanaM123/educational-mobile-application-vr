import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edu_app/model/video_call_info_model.dart';

class VideoCallInfoRepository {
  final FirebaseFirestore _firestore;

  VideoCallInfoRepository({FirebaseFirestore firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  Future<void> addVCInfo(String email, String id, String token) async {

    try {
      final addUser = await _firestore.collection('video_call_info').doc(id).set({
        'id': id,
        'email': email,
        'token': token,
      });

      return addUser;

    } catch(error) {
      print('error');
    }

  }

  String tkn;

  Future<void> getToken(String id) async {
    var document = await _firestore.collection('video_call_info').doc(id).get();
    var data =  await document.data();

    tkn = data['token'];
  }

}