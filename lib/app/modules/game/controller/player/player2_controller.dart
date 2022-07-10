import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jokempo/app/entities/status_player.dart';
part 'player2_state.dart';

class Player2StatusController extends Cubit<Player2State> {
  int life = 20;
  Player2StatusController() : super(const Player2State.initial());

  void reset() {
    life = 20;
    emit(state.copyWith(status: PlayerStatus.pause, life: life));
  }

  void winner() {
    emit(state.copyWith(status: PlayerStatus.winner, life: life));
  }

  void loser() {
    life -= 1;
    emit(state.copyWith(status: PlayerStatus.loser, life: life));
  }

  void draw() {
    emit(state.copyWith(status: PlayerStatus.draw, life: life));
  }
}
