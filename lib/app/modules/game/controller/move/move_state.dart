part of 'move_controller.dart';

enum MoveStatus { initial, gamePoint, gameFinish, failure }

class MoveState extends Equatable {
  final MoveStatus status;
  final String vencedorSet;
  final String vencedorGame;

  const MoveState._({
    required this.status,
    required this.vencedorSet,
    required this.vencedorGame
  });

  const MoveState.initial() : this._(status: MoveStatus.initial,vencedorSet: '',vencedorGame:'');
  
  @override
  List<Object?> get props => [status, vencedorSet,vencedorGame]; //Quais atribuitos serão "escutáveis"  

  MoveState copyWith({
    MoveStatus? status,
    String? vencedorSet,
    String? vencedorGame,
  }) {
    return MoveState._(
      status: status ?? this.status,
      vencedorSet: vencedorSet ?? this.vencedorSet,
      vencedorGame: vencedorGame ?? this.vencedorGame,
    );
  }
}
