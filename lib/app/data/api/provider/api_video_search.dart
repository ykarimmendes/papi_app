import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:papi_app/app/data/api/model/video.dart';

const API_KEY = "AIzaSyDJ5TDdl9ed3l873B6pMYJKXP5eDkPWAQ0";

Future<List<Video>> videos;
http.Response response;

class ApiVideo {

  Future<List<Video>> search(int qtd) async {

    List<List<Video>> todosVideos = new List<List<Video>>();
    var canais = {"UC793yPHQ7ZsLoYjsXRa85MA"};
    //var canais = {"UC793yPHQ7ZsLoYjsXRa85MA", "UCn37JH_JWRE259fwPMf_-Pg"};
    for (var value in canais) {
      var url = Uri.parse(
          "https://www.googleapis.com/youtube/v3/search?order=date&part=snippet,id&channelId=$value&key=$API_KEY&maxResults=$qtd");
      response = await http.get(url);
      todosVideos.add(decode(response));
    }
    return todosVideos.first;
  }

  List<Video> decode(http.Response response) {
    if (response.statusCode == 200) {
      var decoded = json.decode(response.body);
      List<Video> videos = decoded["items"].map<Video>((map) {
        return Video.fromJson(map);
      }).toList();
      return videos;
    } else {
      throw Exception("Erro");
    }
  }
}
