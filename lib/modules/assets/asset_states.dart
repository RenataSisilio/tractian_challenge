import '../../core/app_errors.dart';
import '../../core/utils/typedefs/tree_node.dart';

sealed class AssetState {}

final class LoadingAssetState extends AssetState {}

final class SuccessAssetState extends AssetState {
  SuccessAssetState(this.tree);

  /// The list of locations and assets in the current tree.
  final List<TreeNode> tree;
}

final class ErrorAssetState extends AssetState {
  ErrorAssetState(this.error);

  /// The thrown error, which must be shown to the user.
  final AppError error;
}
