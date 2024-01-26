import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() onSelecao;

  Resposta(this.texto, this.onSelecao);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: const ButtonStyle( 
          backgroundColor: MaterialStatePropertyAll(Colors.blue),
          foregroundColor: MaterialStatePropertyAll(Colors.white) 
        ),
        child: Text(texto),
        onPressed: onSelecao,
      ),
    );
  }
}
