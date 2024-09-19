import 'package:bloc/bloc.dart';

import '../../core/app_errors.dart';
import '../../data/repositories/asset_repository.dart';
import '../../data/repositories/location_repository.dart';
import '../../models/asset.dart';
import '../../models/location.dart';
import 'asset_states.dart';

class AssetController extends Cubit<AssetState> {
  AssetController(this._assetRepo, this._locationRepo)
      : super(LoadingAssetState());

  final AssetRepository _assetRepo;
  final LocationRepository _locationRepo;

  /// Loads all data from the current company.
  Future<void> loadFrom(String companyId) async {
    emit(LoadingAssetState());

    try {
      final results = await Future.wait([
        _locationRepo.getAllLocations(companyId),
        _assetRepo.getAllAssets(companyId),
      ]);

      final locations = results.first as List<Location>;
      final assets = results.last as List<Asset>;

      emit(SuccessAssetState(locations: locations, assets: assets));
    } on AppError catch (e) {
      emit(ErrorAssetState(e));
    }
  }
}
