import 'dart:ui';

import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:jokempo/app/modules/game/controller/move/move_controller.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jokempo/app/modules/game/controller/player/player1_controller.dart';
import 'package:jokempo/app/modules/game/controller/player/player2_controller.dart';
import 'package:jokempo/app/modules/game/widgets/player_widget.dart';
import 'package:jokempo/app/modules/game/widgets/select_move.dart';

class GamePage extends StatefulWidget {
  final MoveStatusController controller;
  final Player1StatusController controllerPlayer1;
  final Player2StatusController controllerPlayer2;

  const GamePage(
      {Key? key,
      required this.controller,
      required this.controllerPlayer1,
      required this.controllerPlayer2})
      : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jokempo'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(8, 20, 8, 8),
                  child: Center(
                    child: Text('Pedra, papel e tesoura'),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        BlocBuilder<Player1StatusController, Player1State>(
                          bloc: widget.controllerPlayer1,
                          builder: (context, state) {
                            print(state.status);
                            return PlayerWidget(
                                status: state.status,
                                life: state.life,
                                player: '1');
                          },
                        ),
                        BlocBuilder<Player2StatusController, Player2State>(
                          bloc: widget.controllerPlayer2,
                          builder: (context, state) {
                            print(state.status);
                            return PlayerWidget(
                                status: state.status,
                                life: state.life,
                                player: '2');
                          },
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Escolha sua jogada'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SelectMove(
                          height: 210,
                          moveStatusController: widget.controller,
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 150,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          widget.controller.registerMove();
                        },
                        child: const Text('Jogar'),
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          widget.controller.reset();
                        },
                        child: const Text('Resetar'),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
