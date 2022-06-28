import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:jokempo/app/core/move_calculator.dart';
import 'package:jokempo/app/modules/game/controller/player/player1_controller.dart';
import 'package:jokempo/app/modules/game/controller/player/player2_controller.dart';
part 'move_state.dart';

class MoveStatusController extends Cubit<MoveState> {
  final MoveCalculator _moveCalculator;
  final Player1StatusController _player1statusController;
  final Player2StatusController _player2statusController;
  String moveSelected = 'pedra';

  MoveStatusController(
      {required MoveCalculator moveCalculator,
      required Player1StatusController player1StatusController,
      required Player2StatusController player2StatusController})
      : _moveCalculator = moveCalculator,
        _player1statusController = player1StatusController,
        _player2statusController = player2StatusController,
        super(const MoveState.initial());

  Future<void> registerMove() async {
    final moveCPU = _moveCalculator.getMoveCPU();
    final playerWinner = _moveCalculator.registerMove(moveSelected, moveCPU);

    if (playerWinner == "player1") {
      _player1statusController.winner();
      _player2statusController.loser();
    } else if (playerWinner == "player2") {
      _player1statusController.loser();
      _player2statusController.winner();
    } else if(playerWinner == "draw"){
      _player1statusController.draw();
      _player2statusController.draw();
    }

    emit(state.copyWith(
        status: MoveStatus.gamePoint, vencedorSet: playerWinner));
  }

  void reset() {
    _player1statusController.reset();
    _player2statusController.reset();
    emit(state.copyWith(
        status: MoveStatus.initial, vencedorSet: "", vencedorGame: ""));
  }


}
