import 'package:cloud_firestore/cloud_firestore.dart';

class VideoRepository {

  Future<QuerySnapshot>  getAll() async{
    return await FirebaseFirestore.instance.collection('video').get();
  }

}