import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jokempo/app/entities/status_player.dart';
part 'player1_state.dart';

class Player1StatusController extends Cubit<Player1State> {
  int life = 0;
  Player1StatusController() : super(const Player1State.initial());

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
