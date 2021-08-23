import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:papi_app/app/data/api/model/video.dart';
import 'package:papi_app/app/data/api/repository/video_repository.dart';

class VideoController {
  final VideoRepository _repository = new VideoRepository();

  Future<QuerySnapshot> getAll() {
    return _repository.getAll();
  }
}
