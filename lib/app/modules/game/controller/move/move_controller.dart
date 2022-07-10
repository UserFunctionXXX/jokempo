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
  List<int>pointsPLayers = [0,0];

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
      pointsPLayers[0]++;
      _player1statusController.winner();
      _player2statusController.loser();
      emit(state.copyWith(status: MoveStatus.reset));
      emit(state.copyWith(status: MoveStatus.winner,winner: 'player1',message: 'Player 1 venceu a rodada'));
    } else if (playerWinner == "player2") {
      pointsPLayers[1]++;
      _player1statusController.loser();
      _player2statusController.winner();
      emit(state.copyWith(status: MoveStatus.reset));
      emit(state.copyWith(status: MoveStatus.winner,winner: 'player2',message: 'Player 2 venceu a rodada'));
    } else if (playerWinner == "draw") {
      _player1statusController.draw();
      _player2statusController.draw();
      emit(state.copyWith(status: MoveStatus.reset));
      emit(state.copyWith(status: MoveStatus.draw,message: 'Empate. Joguem novamente'));
    }

    if (pointsPLayers[0] >= 20 || pointsPLayers[1] >=20 ){

      emit(state.copyWith(status: MoveStatus.reset));      
      if (pointsPLayers[0] >= 20){
         emit(state.copyWith(status: MoveStatus.winnerGame,winner: 'player1',message: 'O grande vencedor do game foi o Player 1'));
      }else{
        emit(state.copyWith(status: MoveStatus.winnerGame,winner: 'player2',message: 'O grande vencedor do game foi o Player 2'));
      }
      
      _player1statusController.reset();
      _player2statusController.reset();
    }
  }

  void reset() {
    _player1statusController.reset();
    _player2statusController.reset();
    emit(state.copyWith(status: MoveStatus.initial, winner: ""));
  }
}
