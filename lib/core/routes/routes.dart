import 'modular_routes.dart';

abstract interface class Routes {
  /// Route management implementation
  static Routes get i => ModularRoutes();

  static const root = '/';

  static const home = '/home';

  static const assets = '/assets';

  /// Pop the current route off the navigator and navigate to a route.
  Future<T?> popAndPushNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    TO? result,
    Object? arguments,
  });

  /// Navigate to a route.
  Future<T?> pushNamed<T extends Object?>(
    String routeName, {
    Object? arguments,
  });

  /// Push the route with the given name onto the navigator that most tightly
  /// encloses the given context.
  Future<T?> pushNamedAndRemoveUntil<T extends Object?>(
    String newRouteName, {
    Object? arguments,
  });

  /// Replace the current route of the navigator that most tightly encloses the
  /// given context by pushing the route named routeName and then disposing the
  /// previous route once the new route has finished animating in.
  Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    TO? result,
    Object? arguments,
  });

  /// Removes the current Route from the stack of routes.
  void pop<T extends Object?>([T result]);

  /// The initial route cannot be popped off the navigator, which implies that
  /// this function returns true only if popping the navigator would not remove
  /// the initial route.
  bool canPop();

  /// Consults the current route's Route.willPop method, and acts accordingly,
  /// potentially popping the route as a result; returns whether the pop request
  /// should be considered handled.
  Future<bool> maybePop<T extends Object?>([T result]);

  /// Navigate to a new screen.
  /// This action replaces all past routes.
  void navigate(String path, {dynamic arguments});
}
