import '../../core/private/api_paths.dart';
import '../../models/location.dart';
import '../clients/client_interface.dart';
import '../errors/mapping_errors.dart';
import '../mappings/location_mapping.dart';

final class LocationRepository {
  LocationRepository(this._client);

  final ClientInterface _client;

  /// Returns a List of all locations in the company,
  /// or throws an ```InvalidDataFormatError``` in case of error.
  Future<List<Location>> getAllLocations(String companyId) async {
    try {
      final apiResponse = await _client.getAll(ApiPaths.locations(companyId));

      return apiResponse.map(_tryConvert).toList();
    } catch (e) {
      rethrow;
    }
  }

  Location _tryConvert(e) => e is Map<String, dynamic>
      ? e.toLocation()
      : throw InvalidDataFormatError(
          data: e,
          expectedFormat: 'Map<String, dynamic>',
        );
}
