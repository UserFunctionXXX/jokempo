import 'dart:math';

import 'package:asuka/asuka.dart';
class MoveCalculator {
  final Map<String, List<String>> _jogadas = {};

  MoveCalculator() {
    _jogadas['pedra'] = [];
    _jogadas['pedra']!.add('tesoura');

    _jogadas['papel'] = [];
    _jogadas['papel']!.add('pedra');

    _jogadas['tesoura'] = [];
    _jogadas['tesoura']!.add('papel');
  }

  String registerMove(String player1, String player2) {
    String result = 'draw';

    if (player1 == player2) {
      print('empate');
    } else {
      try {
        if (_jogadas[player1]!.contains(player2)) {
          result = 'player1';
          print('player 1 venceu');
        } else {
          result = 'player2';
          print('player 2 venceu');
        }
      } catch (e) {
        AsukaSnackbar.alert('Jogada inválida').show();
      }
   
    }

    return result;
  }

  String getMoveCPU(){
    final List<String> moves = ['pedra','papel','tesoura'];
    return  moves[Random().nextInt(2)];

  }
}
