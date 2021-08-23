import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VideoScreen extends StatefulWidget {
  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {

  final Color amareloTopo = Color.fromRGBO(250, 180, 24, 1);
  final Color corFundo = Color.fromRGBO(30, 30, 30, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: corFundo,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: amareloTopo,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5, top: 10, bottom: 15),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 10),
                    child: Image.asset(
                      "assets/enq.png",
                      width: 25,
                      height: 25,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: Text(
                      "Eh Noiz Queiroz",
                      style: TextStyle(color: amareloTopo, fontFamily: 'LibreBaskerville-Italic'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 0, right: 10, top: 10),
                    child: Text(
                      "15 dias",
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: Stack(
                children: [
                  Image.asset("assets/prejogo.PNG"),
                  Positioned(
                      top: 70,
                      left: 170,
                      child: Image.asset(
                        "assets/yt.png",
                        width: 80,
                        height: 80,
                      )),
                ],
              ),
            ),
            Container(
              height: 60,
              decoration: BoxDecoration(
                color: Color.fromRGBO(21, 21, 21, 0),
                border: Border.all(width: 3, color: Colors.black),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(flex: 40, child: buildIcon(Icons.favorite_outline)),
                    Expanded(flex: 1, child: Container(width: 10, color: Colors.black,)),
                    Expanded(flex: 40, child: buildIcon(Icons.share)),
                    Expanded(flex: 1, child: Container(width: 10, color: Colors.black,)),
                    Expanded(flex: 50, child: buildButton('Seja Membro'))
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16, top: 16),
              child: Text(
                "Pré Noiz - NÁUTICO X CLUBE DO REMO - Série B 2021",
                style: TextStyle(
                    color: Colors.white,
                    height: 1.8,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'LibreBaskerville-Bold',
                    fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 15),
              child: Row(
                children: [
                  buildTag("live", 10),
                  buildTag("Pré Jogo", 80),
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.all(8)),
                    Text(
                      "Remo vai à Recife enfrentar o líder Náutico. "
                      "\nJogo difícil e importante. Remo precisa pontuar. Será que o Leão Azul termina a invencibilidade do timbu? \n\n"
                      "Vem com Noiz Seja membro deste canal e ganhe benefícios: https://www.youtube.com/channel/UC793..."
                      "\n\n\Papo entre amigos para amigos",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        height: 1.3,
                        fontFamily: 'LibreBaskerville-Bold',
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(18))
                  ],
                )),
          ],
        ),
      ),
    );
  }

  buildButton(String text) {
    return Container(
      padding: EdgeInsets.only(left:10),
      width: 120,
      height: 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: amareloTopo,
            side: BorderSide(
              width: 2,
              color: Colors.black,
            )),
        onPressed: () {},
        child: Text(
          text,
          style: TextStyle(
              fontFamily: 'LibreBaskerville-Italic',
              color: Colors.black,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  buildIcon(IconData icon) {
    return Icon(
      icon,
      color: Colors.white,
      size: 30,
    );
  }

  buildTag(String text, double left) {
    return Container(
      width: text.length * 12.0,
      height: 25,
      decoration: BoxDecoration(
        color: amareloTopo,
        border: Border.all(width: 3, color: Colors.black),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              fontFamily: 'LibreBaskerville-Italic',
              fontWeight: FontWeight.bold,
              fontSize: 12),
        ),
      ),
    );
  }
}
