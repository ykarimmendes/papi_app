import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EnqueteScreen extends StatelessWidget  {

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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildLogo(),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                "Você acha que o mito Eduardo Ramos é ídolo do Clube do Remo?",
                style: TextStyle(
                    fontFamily: 'LibreBaskerville-Regular',
                    color: Colors.white,
                    height: 1.5,
                    fontSize: 25),
              ),
            ),
            buildPergunta(false, "Claro que não"),
            buildPergunta(true, "kkkkkkk"),
            buildPergunta(false, "Não é "),
            buildPergunta(false, "Nunca será"),
            Padding(padding: EdgeInsets.all(16)),
            buildButton("Enviar Respostas")
          ],
        ),
      ),
    );
  }

  buildPergunta(bool check, String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 8, left: 12, right: 12),
      child: Container(
        decoration: BoxDecoration(
            color: check ? amareloTopo : Colors.white,
            borderRadius: BorderRadius.circular(12)),
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                text,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: check
                  ? Icon(
                      Icons.check,
                      color: Colors.black,
                      size: 25,
                    )
                  : Container(),
            )
          ],
        ),
      ),
    );
  }

  buildButton(String text) {
    return Container(
      padding: EdgeInsets.only(top: 10, left: 10),
      width: 450,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: amareloTopo,
        ),
        onPressed: () {},
        child: Text(
          text,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
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

  buildLogo() {
    return Padding(
      padding: const EdgeInsets.only(left: 5, top: 10, bottom: 0),
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
    );
  }
}
