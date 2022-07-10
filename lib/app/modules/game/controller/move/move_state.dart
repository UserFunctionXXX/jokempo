part of 'move_controller.dart';

enum MoveStatus { initial, winner,winnerGame, draw, reset }

class MoveState extends Equatable {
  final MoveStatus status;
  final String winner;
  final String message;

  const MoveState._({
    required this.status,
    required this.winner,
    required this.message
  });

  const MoveState.initial() : this._(status: MoveStatus.initial,winner: '',message:'');
  
  @override
  List<Object?> get props => [status, winner]; //Quais atribuitos serão "escutáveis"  

  MoveState copyWith({
    MoveStatus? status,
    String? winner,
    String? message,
  }) {
    return MoveState._(
      status: status ?? this.status,
      winner: winner ?? this.winner,
      message: message ?? this.message,
    );
  }
}
