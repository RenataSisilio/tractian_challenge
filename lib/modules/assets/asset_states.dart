import '../../core/app_errors.dart';
import '../../models/named_entity.dart';

sealed class AssetState {}

final class LoadingAssetState extends AssetState {}

final class SuccessAssetState extends AssetState {
  SuccessAssetState(this.items);

  /// The list of locations and assets in the current tree.
  final List<NamedEntity> items;
}

final class ErrorAssetState extends AssetState {
  ErrorAssetState(this.error);

  /// The thrown error, which must be shown to the user.
  final AppError error;
}
