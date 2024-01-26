import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {

  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;

  Resultado(this.pontuacao, this.quandoReiniciarQuestionario);

  String get fraseResultado {
    if(pontuacao < 8){
      return 'Parabéns!';
    }else if (pontuacao < 12){
      return 'Você é bom!';
    }else if (pontuacao < 16){
      return 'Impresionante!';
    }else{
      return 'Nível absurdo!';
    }
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: TextStyle(fontSize: 30),
          ),
        ),
        TextButton(
          style: ButtonStyle(foregroundColor: MaterialStatePropertyAll(Colors.blue)),
          child: Text(
            'Reiniciar?',
            style: TextStyle(fontSize: 18),
            ),
          onPressed: quandoReiniciarQuestionario,
        ),
      ],
    );
  }
}