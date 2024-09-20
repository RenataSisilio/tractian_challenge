import 'package:bloc/bloc.dart';

import '../../core/app_errors.dart';
import '../../core/utils/extensions/sort_tree.dart';
import '../../core/utils/typedefs/tree_node.dart';
import '../../data/repositories/asset_repository.dart';
import '../../data/repositories/location_repository.dart';
import '../../models/named_entity.dart';
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

      emit(SuccessAssetState(_buildTree(allItems)));
    } on AppError catch (e) {
      emit(ErrorAssetState(e));
    }
  }

  List<TreeNode> _buildTree(List<NamedEntity> items) {
    // TODO: verify tree size and build partially to improve performance

    final (rootNodes, subNodes) = _splitRootNodes(items);

    final tree = _insert(subNodes: subNodes, tree: rootNodes);

    return tree.sorted;
  }

  (List<TreeNode>, List<TreeNode>) _splitRootNodes(List<NamedEntity> items) {
    final tree = <TreeNode>[];
    final subNodes = <TreeNode>[];

    for (var item in items) {
      final newTreeNode = (item, []);

      if (item.parentId == null) {
        tree.add(newTreeNode);
      } else {
        subNodes.add(newTreeNode);
      }
    }

    return (tree, subNodes);
  }

  List<TreeNode> _insert({
    required List<TreeNode> subNodes,
    required List<TreeNode> tree,
  }) {
    for (var subNode in subNodes) {
      if (subNode.parentId != null) {
        final parentNode = _searchFor(subNode.parentId!, tree: tree);
        if (parentNode == null) {
          tree.add(subNode);
        } else {
          parentNode.addChild(subNode);
        }
      }
    }

    return tree;
  }

  TreeNode? _searchFor(String id, {required List<TreeNode> tree}) {
    for (var node in tree) {
      if (node.id == id) {
        return node;
      }
      if (_searchFor(id, tree: node.children) case TreeNode node) {
        return node;
      }
    }
    return null;
  }

  void filterByName(String search) {}

  void filterEnergySensor(bool isFiltering) {}

  void filterCritical(bool isFiltering) {}
}
