import 'package:cloud_firestore/cloud_firestore.dart';

class Video{

  final String videoId;
  final String title;
  final String thumb;
  final String channel;
  final String description;
  final String  publishedAt;
  DocumentReference reference;

  Video({this.description, this.videoId, this.title, this.thumb, this.channel, this.publishedAt});

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
        videoId: json["id"]["videoId"],
        title: json["snippet"]["title"],
        publishedAt: json["snippet"]["publishTime"],
        thumb: json["snippet"]["thumbnails"]["high"]["url"],
        channel: json["snippet"]["channelTitle"],
        description: json["snippet"]["description"]);
  }
  Video.fromSnapshot(DocumentSnapshot snapshot) :
      this.fromMap(snapshot.data(), reference: snapshot.reference);

  Video.fromMap(Map<String, dynamic> map, {this.reference})
    :  videoId = map["videoId"],
    title = map["title"],
    publishedAt = map["publishedAt"],
    thumb = map["thumb"],
    channel = map["channelTitle"],
    description = map["description"];

}