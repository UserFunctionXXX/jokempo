import 'package:flutter_modular/flutter_modular.dart';
import 'package:jokempo/app/modules/game/controller/move/move_controller.dart';
import 'package:jokempo/app/modules/game/controller/player/player1_controller.dart';
import 'package:jokempo/app/modules/game/controller/player/player2_controller.dart';
import 'package:jokempo/app/modules/game/game_page.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

class GameModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        BlocBind.lazySingleton<Player1StatusController>((i) => Player1StatusController()),
        BlocBind.lazySingleton<Player2StatusController>((i) => Player2StatusController()),
        BlocBind.lazySingleton<MoveStatusController>((i) => MoveStatusController(moveCalculator: i(), player1StatusController: i(),player2StatusController: i())),
        
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: ((context, args) => GamePage(
                  controller: Modular.get(),controllerPlayer1: Modular.get(),controllerPlayer2: Modular.get(),
                ))),
      ];
}
