part of 'player2_controller.dart';

extension Player2Status on PlayerStatus{}

class Player2State extends Equatable {
  final PlayerStatus status;
  final int life;

  const Player2State._({
    required this.status,
    required this.life,
  });

  const Player2State.initial() : this._(status: PlayerStatus.pause,life: 20);
  
  @override
  List<Object?> get props => [status, life]; //Quais atribuitos serão "escutáveis"  

  Player2State copyWith({
    PlayerStatus? status,
    int? life,
  }) {
    return Player2State._(
      status: status ?? this.status,
      life: life ?? this.life,
    );
  }
}
