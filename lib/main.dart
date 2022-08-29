
import 'package:flutter/material.dart';
import 'dart:math';

void main () {

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold (
      appBar: AppBar (
        title: Text("Frases do dia"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: BodyStateful(),
    ),
  ));
}
class BodyStateful extends StatefulWidget {
  @override
  State<BodyStateful> createState() => _BodyStatefulState();
}

class _BodyStatefulState extends State<BodyStateful> {

  var _texto = "Clique no botão abaixo e receba a mensagem do dia!";
  var _lastIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container (
          padding: EdgeInsets.only(left: 16, right: 16),
          child: Image.asset(
            "images/frases femininas.png",
          ),
        ),
        Container(
            padding: EdgeInsets.only(left:16, right:16),
            margin: EdgeInsets.only(bottom: 16),
            child:
            Text (
              _texto,
              style: TextStyle (
                fontSize: 20,
              ),
            )
        ),
        ElevatedButton(
          onPressed: () {
            var numero = getRandomIndex(frases.length, _lastIndex);
            _lastIndex = numero;
            setState(() {
              _texto = frases[numero];
            });
          },
          child: Text (
            "Receber frase",
            style: TextStyle (
                fontSize: 20,
                color: Colors.white,
                decoration: TextDecoration.none
            ),
          ),
          style: ElevatedButton.styleFrom(
              primary: Colors.pink
          ),
        )
      ],
    );
  }
}


int getRandomIndex(length, lastIndex){
  final random = new Random();
  var numero = random.nextInt(length);
  while(lastIndex == numero){
    numero = random.nextInt(length);
  }
  return numero;
}

const frases = [
  "Quando você falha, a vida continua e você precisa aprender a se reerguer e começar de novo!",
  "Mulheres são capazes de fazer tudo, desde que elas estejam dispostas e motivadas.",
  "Não importa onde você esteja, você só precisa se manter firme aos seus princípios e a tudo dará certo.",
];