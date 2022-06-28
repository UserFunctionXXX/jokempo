part of 'player1_controller.dart';

extension Player1Status on PlayerStatus{}

class Player1State extends Equatable {
  final PlayerStatus status;
  final int life;

  const Player1State._({
    required this.status,
    required this.life,
  });

  const Player1State.initial() : this._(status: PlayerStatus.pause,life: 20);
  
  @override
  List<Object?> get props => [status, life]; //Quais atribuitos serão "escutáveis"  

  Player1State copyWith({
    PlayerStatus? status,
    int? life,
  }) {
    return Player1State._(
      status: status ?? this.status,
      life: life ?? this.life,
    );
  }
}
