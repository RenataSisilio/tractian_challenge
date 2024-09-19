import '../../core/app_errors.dart';
import '../../models/company.dart';

sealed class HomeState {}

final class LoadingHomeState extends HomeState {}

final class SuccessHomeState extends HomeState {
  SuccessHomeState(this.companies);

  /// The list of the companies to be shown to the user.
  final List<Company> companies;
}

final class ErrorHomeState extends HomeState {
  ErrorHomeState(this.error);

  /// The thrown error, which must be shown to the user.
  final AppError error;
}
