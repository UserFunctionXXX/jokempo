import 'package:flutter_modular/flutter_modular.dart';
import 'package:jokempo/app/core/move_calculator.dart';
import 'package:jokempo/app/modules/game/game_module.dart';
import 'package:jokempo/app/modules/splash/splash_page.dart';
class AppModule extends Module {
  @override
  List<Bind> get binds => [ 
    Bind.lazySingleton<MoveCalculator>((i) => MoveCalculator()),
  ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const SplashPage()),
        ModuleRoute('/game', module: GameModule()),
        //ModuleRoute('/login', module: LoginModule()),
        
      ];
}
