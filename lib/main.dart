import 'package:flutter/material.dart';
import 'resultado.dart';
import 'questionario.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  final List<Map<String, Object>> _perguntas = [
    {
      'texto': 'Qual é sua cor favorita?',
      'respostas': [
        {'texto': 'Vermelho', 'pontuacao': 6},
        {'texto': 'Azul', 'pontuacao': 7},
        {'texto': 'Roxo', 'pontuacao': 9},
        {'texto': 'Preto', 'pontuacao': 10},
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Leão', 'pontuacao': 9}, 
        {'texto': 'Cachorro', 'pontuacao': 8}, 
        {'texto': 'Gato', 'pontuacao': 10}, 
        {'texto': 'Cobra', 'pontuacao': 6}
      ]
    },
    {
      'texto': 'Qual é cantor favorito?',
      'respostas': [
        {'texto': 'Mc IG', 'pontuacao': 8},
        {'texto': 'Matue', 'pontuacao': 10}, 
        {'texto': 'Roberto Carlos', 'pontuacao': 7}, 
        {'texto': 'Kanye West', 'pontuacao': 9},
        ]
    }
  ];
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  void _responder(int pontuacao) {
    setState(() {
      _perguntaSelecionada++;
      _pontuacaoTotal += pontuacao;
    });
  }

  void _reiniciarQuestionario(){
    setState((){
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Perguntas',
            style: TextStyle(fontSize: 24),
          ),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                responder: _responder,
              )
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
