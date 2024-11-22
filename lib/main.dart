import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionario.dart';
import 'package:projeto_perguntas/resultado.dart';

void main() => runApp(_PerguntaApp());

class _PerguntaAppState extends State<_PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 10},
        {'texto': 'Vermelho', 'pontuacao': 5},
        {'texto': 'Verde', 'pontuacao': 3},
        {'texto': 'Branco', 'pontuacao': 1},
      ]
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Coelho', 'pontuacao': 1},
        {'texto': 'Cobra', 'pontuacao': 4},
        {'texto': 'Elefante', 'pontuacao': 7},
        {'texto': 'Leão', 'pontuacao': 9},
      ]
    },
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Maria', 'pontuacao': 8},
        {'texto': 'João', 'pontuacao': 3},
        {'texto': 'Léo', 'pontuacao': 2},
        {'texto': 'Pedro', 'pontuacao': 7},
      ]
    },
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
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
            title: const Text('Perguntas'),
            backgroundColor: const Color.fromRGBO(42, 134, 177, 1),
            centerTitle: true,
            titleTextStyle: const TextStyle(
                color: Color.fromARGB(255, 255, 255, 255), fontSize: 20),
          ),
          body: temPerguntaSelecionada
              ? Questionario(
                  perguntas: _perguntas,
                  perguntaSelecionada: _perguntaSelecionada,
                  quandoResponder: _responder)
              : Resultado(
                  pontuacao: _pontuacaoTotal,
                  quandoReiniciarQuestionario: _reiniciarQuestionario)),
    );
  }
}

class _PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
