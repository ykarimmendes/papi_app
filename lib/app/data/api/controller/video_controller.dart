import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:papi_app/app/data/api/model/video.dart';
import 'package:papi_app/app/data/api/repository/video_repository.dart';

class VideoController {
  final VideoRepository _repository = new VideoRepository();
  StreamController<List<Video>> controller = StreamController<List<Video>>();

  Stream<List<Video>> getAll() {
    Stream stream = controller.stream;
    List<Video> allVideos = new List<Video>();
    _repository.getAll().listen((event) {
      event.docs.asMap().forEach((key, value) {
        allVideos.add(Video.fromSnapshot(value));
      });
      controller.add(allVideos);
    });
  }
}
