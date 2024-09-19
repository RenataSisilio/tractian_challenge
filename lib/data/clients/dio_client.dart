import 'package:dio/dio.dart';

import '../errors/client_errors.dart';
import 'client_interface.dart';

final class DioClient implements ClientInterface {
  DioClient(this._dio) {
    _dio.options = BaseOptions(
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 15),
      baseUrl: '',
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
  }

  final Dio _dio;

  @override
  Future<List<dynamic>> getAll(String endpoint, {String? id}) async {
    try {
      final response = await _dio.get(endpoint + (id ?? ''));
      return response.data;
    } on DioException catch (e) {
      throw DioConnectionError(e);
    } catch (e) {
      throw UnespecifiedClientError(e);
    }
  }
}
