import 'package:flutter/material.dart';
import 'package:jokempo/app/entities/status_player.dart';

class PlayerWidget extends StatefulWidget {
  final PlayerStatus status;
  final int life;
  final String player;
  const PlayerWidget(
      {Key? key,
      required this.life,
      required this.player,
      required this.status})
      : super(key: key);

  @override
  State<PlayerWidget> createState() => _PlayerWidgetState();
}

class _PlayerWidgetState extends State<PlayerWidget>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.bounceOut,
  );
  @override
  Widget build(BuildContext context) {
    if (widget.status == PlayerStatus.winner) {
      return Column(
        children: [
          Image.asset(
            'assets/images/player${widget.player}_winner.png',
            width: 150,
            height: 150,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.green,
              border: Border.all(width: 2, color: Colors.black),
              borderRadius: const BorderRadius.all(
                Radius.circular(7.0),
              ),
            ),
            height: 35,
            width: 150,
            child: Center(child: Text(widget.life.toString()),),
          ),
        ],
      );
    } else if (widget.status == PlayerStatus.loser) {
      return Column(
        children: [
          FadeTransition(
            opacity: _animation,
            child: Image.asset(
              'assets/images/player${widget.player}_loser.png',
              width: 150,
              height: 150,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.red,
              border: Border.all(width: 2, color: Colors.black),
              borderRadius: const BorderRadius.all(
                Radius.circular(7.0),
              ),
            ),
            height: 35,
            width: 150,
            child: Center(child: Text(widget.life.toString()),),
          ),
        ],
      );
    } else {
      return Column(
        children: [
          Image.asset(
            'assets/images/player${widget.player}.png',
            height: 150,
            width: 150,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(width: 2, color: Colors.black),
              borderRadius: const BorderRadius.all(
                Radius.circular(7.0),
              ),
            ),
            height: 35,
            width: 150,
            child: Center(child: Text(widget.life.toString()),),
          ),
        ],
      );
    }
  }
}
