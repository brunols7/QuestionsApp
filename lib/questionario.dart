import 'package:flutter/material.dart';
import './questao.dart';
import 'respostas.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) responder;
  
  Questionario({
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.responder,
  });
  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
    ? perguntas[perguntaSelecionada]['respostas'] as List<Map<String, Object>>
    : [];


    return Column(
          children: [
            Questao(perguntas[perguntaSelecionada]['texto'].toString()),
            ...respostas
            .map((resp) {
              return Resposta(
                resp['texto'].toString(),
                () => responder(int.parse(resp['pontuacao'].toString())),
              );
            }).toList(),
          ],
        );
  }
}