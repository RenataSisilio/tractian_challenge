import '../../core/app_errors.dart';
import '../../models/asset.dart';
import '../../models/location.dart';

sealed class AssetState {}

final class LoadingAssetState extends AssetState {}

final class SuccessAssetState extends AssetState {
  SuccessAssetState({required this.locations, required this.assets});

  /// The list of locations in the current tree.
  final List<Location> locations;

  /// The list of assets in the current tree.
  final List<Asset> assets;
}

final class ErrorAssetState extends AssetState {
  ErrorAssetState(this.error);

  /// The thrown error, which must be shown to the user.
  final AppError error;
}
