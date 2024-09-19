import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../core/routes/routes.dart';
import '../data/clients/client_interface.dart';
import '../data/clients/dio_client.dart';
import 'assets/asset_module.dart';
import 'home/home_module.dart';

final class AppModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.addInstance(Dio());
    i.addSingleton<ClientInterface>(DioClient.new);
  }

  @override
  void routes(RouteManager r) {
    r.module(Routes.root, module: HomeModule());
    r.module(Routes.assets, module: AssetModule());
  }
}
