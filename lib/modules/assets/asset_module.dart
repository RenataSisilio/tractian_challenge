import 'package:flutter_modular/flutter_modular.dart';

import '../../core/routes/routes.dart';
import '../../data/repositories/asset_repository.dart';
import '../../data/repositories/location_repository.dart';
import '../app_module.dart';
import 'asset_controller.dart';
import 'asset_page.dart';

final class AssetModule extends Module {
  @override
  List<Module> get imports => [AppModule()];

  @override
  void binds(Injector i) {
    i.addSingleton(LocationRepository.new);
    i.addSingleton(AssetRepository.new);
    i.addLazySingleton(AssetController.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      Routes.root,
      child: (context) => AssetPage(
        Modular.get(),
        companyId: Modular.args.data,
      ),
    );
  }
}
