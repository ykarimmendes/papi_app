import 'package:cloud_firestore/cloud_firestore.dart';

class VideoRepository {

  Stream<QuerySnapshot>  getAll() {
    return  FirebaseFirestore.instance.collection('video').snapshots();
  }

}