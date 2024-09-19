import '../../core/private/api_paths.dart';
import '../../models/company.dart';
import '../clients/client_interface.dart';
import '../errors/mapping_errors.dart';
import '../mappings/company_mapping.dart';

final class CompanyRepository {
  CompanyRepository(this._client);

  final ClientInterface _client;

  /// Returns a List of all the registered companies,
  /// or throws an ```InvalidDataFormatError``` in case of error.
  Future<List<Company>> getAllCompanies() async {
    try {
      final apiResponse = await _client.getAll(ApiPaths.companies);
      return apiResponse.map(_tryConvert).toList();
    } catch (e) {
      rethrow;
    }
  }

  Company _tryConvert(e) => e is Map<String, dynamic>
      ? e.toCompany()
      : throw InvalidDataFormatError(
          data: e,
          expectedFormat: 'Map<String, dynamic>',
        );
}
