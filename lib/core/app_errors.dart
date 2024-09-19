abstract interface class AppError extends Error {
  AppError(this.message);

  /// A readable description to show to the user on screen.
  final String message;
}

abstract interface class ClientError implements AppError {}

abstract interface class DataError implements AppError {}
