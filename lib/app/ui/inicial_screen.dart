import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:papi_app/app/data/api/controller/video_controller.dart';
import 'package:papi_app/app/data/api/model/video.dart';

class InitialScreen extends StatefulWidget {

  @override
  _InitialScreenState createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  final Color amareloBanner = Color.fromRGBO(254, 203, 9, 1);

  final Color amareloTopo = Color.fromRGBO(250, 180, 24, 1);

  final Color corFundo = Color.fromRGBO(30, 30, 30, 1);

  final Color corFundo2 = Color.fromRGBO(51, 51, 51, 1);

  @override
  Widget build(BuildContext context) {
    VideoController controller = VideoController();
    controller.getAll();

    return Scaffold(
      bottomNavigationBar: getBottomNavigationBar(),
      drawer: Drawer(
        child: Container(
          color: amareloTopo,
          child: buildDrawer(),
        ),
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: amareloTopo,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Container(
            //   color: amareloBanner,
            //   height: 50,
            //   width: MediaQuery.of(context).size.width,
            // ),
            buildColuna(),
            StreamBuilder<List<Video>>(
                stream: controller.controller.stream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index){
                          return buildVideo(snapshot.data.elementAt(index));
                        });

                  } else {
                    return Text("Load", style: TextStyle(fontSize: 20,color: Colors.white),);
                  }
                }),

            buildPodcast(),
            Padding(padding: EdgeInsets.all(8)),
          ],
        ),
      ),
      backgroundColor: corFundo,
    );
  }

  Container buildPodcast() {
    return Container(
      width: 380,
      height: 140,
      child: Row(
        children: [
          Column(
            children: [
              Expanded(
                flex: 70,
                child: Column(
                  children: [
                    Expanded(
                        flex: 65,
                        child: Container(
                          color: amareloTopo,
                          width: 130,
                          child: Image.asset(
                            "assets/chamaovar.png",
                            fit: BoxFit.cover,
                          ),
                        )),
                    Expanded(
                      flex: 35,
                      child: Container(
                        color: amareloTopo,
                        width: 130,
                        child: Center(
                            child: Text(
                          "Chama o VAR",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        )),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              Expanded(
                  flex: 65,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                    color: Colors.black,
                    width: 250,
                    child: Text(
                      "#37.B - Vai começar a Série C 21 (Part. Toró Tático)",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          height: 1.4,
                          fontSize: 17),
                    ),
                  )),
              Expanded(
                flex: 40,
                child: Container(
                  color: Colors.black,
                  width: 250,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        "assets/spotify.png",
                        width: 50,
                        height: 50,
                      ),
                      Image.asset(
                        "assets/yt.png",
                        width: 40,
                        height: 40,
                      ),
                      Icon(
                        Icons.favorite_outline,
                        color: amareloTopo,
                      ),
                      Icon(
                        Icons.share,
                        color: amareloTopo,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  buildDrawer() {
    return Column(
      children: [
        Expanded(
            flex: 30,
            child: Container(
              color: Colors.black,
            )),
        Expanded(
          flex: 70,
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(8),
            children: <Widget>[
              buildDrawerItem("Eh Noiz Queiroz", image: "assets/enq.png"),
              buildDrawerItem(
                "Toró Tático",
                image: "assets/toro.png",
              ),
              buildDrawerItem("Chama o Var", image: "assets/chamaovar.png"),
              buildDrawerItem("Chaves Remista",
                  image: "assets/chavesRemista.jpg"),
              Padding(padding: EdgeInsets.all(5)),
              Container(
                color: Colors.black,
                width: 10,
                height: 1,
              ),
              //buildDrawerItem("Vídeos", icon: Icons.video_collection_outlined),
              //buildDrawerItem("Podcast", icon: Icons.audiotrack),
              //buildDrawerItem("Enquetes", icon: Icons.my_library_books),
              //buildDrawerItem("Colunas", icon: Icons.menu_book_outlined),
            ],
          ),
        )
      ],
    );
  }

  buildDrawerItem(String canal, {String image = "", IconData icon}) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        height: 50,
        child: Row(
          children: [
            image == ""
                ? Container()
                : Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.asset(
                        image,
                      ),
                    ),
                  ),
            icon == null ? Container() : Icon(icon),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                canal,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 15,
            )
          ],
        ),
      ),
    );
  }

  Padding buildVideo(Video v) {
    double heightVideo = MediaQuery.of(context).size.height/1.90;
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: heightVideo,
        decoration: BoxDecoration(
          border: Border.all(width: 3, color: Colors.black),
        ),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 75,
                  child: Image.network(
                    v.thumb,
                    fit: BoxFit.cover,
                    width: 480,
                    height: 360,
                  ),
                ),
                Expanded(
                  flex: 25,
                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      v.title,
                      style: TextStyle(
                          height: 1.6,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Expanded(
                  flex: 15,
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 18),
                        child: Text(
                          v.channel,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: amareloBanner),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.only(left: 18),
                          child: Text(
                            "1d atrás",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ))
                    ],
                  ),
                )
              ],
            ),
            Positioned(
              left: 10,
              top: heightVideo * 0.59,
              child: Container(
                width: 70,
                height: 25,
                color: amareloTopo,
                child: Center(
                  child: Text(
                    "Live",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildColuna() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        width: 380,
        height: 500,
        decoration: BoxDecoration(
          border: Border.all(width: 3, color: Colors.black),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: Image.asset(
                  "assets/memoriaenq2.jpeg",
                  alignment: Alignment.topCenter,
                  fit: BoxFit.cover,
                  width: 400,
                  height: 400,
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: Text(
                      "Por Eh Noiz Queiroz",
                      style: TextStyle(
                          color: amareloTopo,
                          fontFamily: 'LibreBaskerville-Italic'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 0, right: 10, top: 10),
                    child: Text(
                      "15 dias",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "\"Memórias do nosso futebol do Leão Azul o maior e mais bonito time\"",
                  style: TextStyle(
                      fontFamily: 'LibreBaskerville-Italic',
                      color: Colors.white,
                      fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  getBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: corFundo,
      type: BottomNavigationBarType.fixed,
      items: BuildNavItems(),
      //onTap: onTabTapped,
      currentIndex: 0,
      selectedItemColor: Color(0xffB18000),
      unselectedItemColor: Colors.white,
//onTap: _onItemTapped,
    );
  }

  List<BottomNavigationBarItem> BuildNavItems() {
    int _indiceAtual = 0;
    return <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
          color: _indiceAtual == 0 ? Color(0xffB18000) : Colors.white,
        ),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.video_collection,
            color: _indiceAtual == 1 ? Color(0xffB18000) : Colors.white),
        label: 'Vídeos',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.audiotrack,
          color: _indiceAtual == 2 ? Color(0xffB18000) : Colors.white,
        ),
        label: 'Podcast',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.menu_book_outlined,
          color: _indiceAtual == 3 ? Color(0xffB18000) : Colors.white,
        ),
        label: 'Colunas',
      ),
    ];
  }
}
