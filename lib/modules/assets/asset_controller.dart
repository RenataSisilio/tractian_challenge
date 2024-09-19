import 'package:bloc/bloc.dart';
import 'package:tractian_challenge/models/named_entity.dart';

import '../../core/app_errors.dart';
import '../../data/repositories/asset_repository.dart';
import '../../data/repositories/location_repository.dart';
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
      final List<NamedEntity> allItems = [];

      final results = await Future.wait([
        _locationRepo.getAllLocations(companyId),
        _assetRepo.getAllAssets(companyId),
      ]);

      for (var e in results) {
        allItems.addAll(e);
      }

      emit(SuccessAssetState(allItems));
    } on AppError catch (e) {
      emit(ErrorAssetState(e));
    }
  }

  void filterByName(String search) {}

  void filterEnergySensor(bool isFiltering) {}

  void filterCritical(bool isFiltering) {}
}
