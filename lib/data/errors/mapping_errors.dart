import '../../core/app_errors.dart';

final class InvalidDataFormatError implements DataError {
  InvalidDataFormatError({required this.data, required this.expectedFormat});

  final Object data;
  final String expectedFormat;

  @override
  String get message => '''
Returned data does not correspond to expected format.

Returned data:
${data.toString()}

Expected format:
$expectedFormat
''';

  @override
  StackTrace? get stackTrace => StackTrace.fromString(message);
}
