import 'package:flutter_modular/flutter_modular.dart';

import '../../core/routes/routes.dart';
import '../../data/repositories/company_repository.dart';
import '../app_module.dart';
import 'home_controller.dart';
import 'home_page.dart';

final class HomeModule extends Module {
  @override
  List<Module> get imports => [AppModule()];

  @override
  void binds(Injector i) {
    i.addSingleton(CompanyRepository.new);
    i.addSingleton(HomeController.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(Routes.root, child: (context) => HomePage(Modular.get()));
  }
}
