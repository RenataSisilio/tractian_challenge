import '../../core/private/api_paths.dart';
import '../../models/asset.dart';
import '../clients/client_interface.dart';
import '../errors/mapping_errors.dart';
import '../mappings/asset_mapping.dart';

final class AssetRepository {
  AssetRepository(this._client);

  final ClientInterface _client;

  /// Returns a List of all assets in the company,
  /// or throws an ```InvalidDataFormatError``` in case of error.
  Future<List<Asset>> getAllAssets(String companyId) async {
    try {
      final apiResponse = await _client.getAll(ApiPaths.assets(companyId));
      return apiResponse.map(_tryConvert).toList();
    } catch (e) {
      rethrow;
    }
  }

  Asset _tryConvert(e) => e is Map<String, dynamic>
      ? e.toAsset()
      : throw InvalidDataFormatError(
          data: e,
          expectedFormat: 'Map<String, dynamic>',
        );
}
