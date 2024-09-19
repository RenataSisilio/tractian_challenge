import 'package:flutter_modular/flutter_modular.dart';
import 'routes.dart';

class ModularRoutes implements Routes {
  @override
  bool canPop() => Modular.to.canPop();

  @override
  Future<bool> maybePop<T extends Object?>([T? result]) =>
      Modular.to.maybePop(result);

  @override
  void navigate(String path, {Object? arguments}) =>
      Modular.to.navigate(path, arguments: arguments);

  @override
  void pop<T extends Object?>([T? result]) => Modular.to.pop(result);

  @override
  Future<T?> popAndPushNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    TO? result,
    Object? arguments,
  }) =>
      Modular.to.popAndPushNamed(
        routeName,
        result: result,
        arguments: arguments,
      );

  @override
  Future<T?> pushNamed<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) =>
      Modular.to.pushNamed(routeName, arguments: arguments);

  @override
  Future<T?> pushNamedAndRemoveUntil<T extends Object?>(
    String newRouteName, {
    Object? arguments,
  }) =>
      Modular.to.pushNamedAndRemoveUntil(
        newRouteName,
        (_) => false,
        arguments: arguments,
      );

  @override
  Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    TO? result,
    Object? arguments,
  }) =>
      Modular.to.pushReplacementNamed(
        routeName,
        result: result,
        arguments: arguments,
      );
}
