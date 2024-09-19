import 'package:dio/dio.dart';

import '../../core/app_errors.dart';

final class DioConnectionError implements ClientError {
  DioConnectionError(this.dioException);

  final DioException dioException;

  @override
  String get message => switch (dioException.type) {
        DioExceptionType.connectionTimeout =>
          'A conexão com o servidor está lenta.\nPor favor, verifique sua conexão e tente novamente.',
        DioExceptionType.sendTimeout =>
          'O envio de dados demorou mais que o esperado.\nPor favor, verifique sua conexão e tente novamente.',
        DioExceptionType.receiveTimeout =>
          'O recebimento de dados demorou mais que o esperado.\nPor favor, verifique sua conexão e tente novamente.',
        DioExceptionType.badCertificate =>
          'Certificado inválido.\nPor favor, entre em contato com o administrador do sistema.',
        DioExceptionType.badResponse =>
          'O servidor retornou uma resposta inválida.\nPor favor, entre em contato com o administrador do sistema.',
        DioExceptionType.cancel =>
          'A conexão com o servidor foi cancelada.\nPor favor, entre em contato com o administrador do sistema.',
        DioExceptionType.connectionError =>
          'Não foi possível conectar-se ao servidor.\nPor favor, verifique sua conexão e tente novamente.',
        DioExceptionType.unknown =>
          'Erro do Dio não especificado.\nPor favor, tente novamente mais tarde.',
      };

  @override
  StackTrace? get stackTrace => dioException.stackTrace;
}

final class UnespecifiedClientError implements ClientError {
  UnespecifiedClientError(this.errorCause);

  final Object errorCause;

  @override
  String get message => errorCause.toString();

  @override
  StackTrace? get stackTrace => StackTrace.fromString(message);
}
