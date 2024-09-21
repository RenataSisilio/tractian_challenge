import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';

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

  final searchController = TextEditingController();
  final searchFocusNode = FocusNode();
  final energyFilterNotifier = ValueNotifier(false);
  final alertFilterNotifier = ValueNotifier(false);

  final List<TreeNode> _tree = [];
  final List<TreeNode> _fullTree = [];

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

      _buildTree(allItems, onlyRootNodes: allItems.length > 1000);

      _fullTree.addAll(_tree);
    } on AppError catch (e) {
      emit(ErrorAssetState(e));
    }
  }

  void _buildTreeAsync(List<NamedEntity> items) {
    _tree.clear();

    final (rootNodes, subNodes) = _splitRootNodes(items);

    while (items.isNotEmpty) {
      final itemSet = <NamedEntity>[];
      if (items.length > 100) {
        itemSet.addAll(items.take(100));
        items.removeRange(0, 100);
      } else {
        itemSet.addAll(items);
        items.clear();
      }

      _tree.addAll(rootNodes);
      rootNodes.clear();

      emit(SuccessAssetState(_tree));

      _insert(subNodes: subNodes, tree: _tree);

      emit(LoadingAssetState());
      emit(SuccessAssetState(_tree.sorted));
    }
  }

  void _buildTree(List<NamedEntity> items, {bool onlyRootNodes = false}) {
    _tree.clear();

    final (rootNodes, subNodes) = _splitRootNodes(items);

    _tree.addAll(rootNodes);
    rootNodes.clear();

    if (!onlyRootNodes) {
      _insert(subNodes: subNodes, tree: _tree);
    }

    emit(SuccessAssetState(_tree.sorted));
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

  void _insert({
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

  void filterByName(String search) {
    if (state is SuccessAssetState) {
      energyFilterNotifier.value = false;
      alertFilterNotifier.value = false;
      applyFilters();
      final items = <NamedEntity>[];

      for (var node in _fullTree) {
        for (var item in node.searchByName(search)) {
          if (!items.contains(item)) {
            items.add(item);
          }
        }
      }

      _buildTree(items);
    }
  }

  void applyFilters() {
    if (!energyFilterNotifier.value && !alertFilterNotifier.value) {
      emit(SuccessAssetState(_fullTree));
    } else if (state is SuccessAssetState) {
      searchFocusNode.unfocus();
      searchController.text = '';
      final items = <NamedEntity>[];

      if (energyFilterNotifier.value) {
        for (var node in _fullTree) {
          for (var item in node.energyChildren) {
            if (!items.contains(item)) {
              items.add(item);
            }
          }
        }
      }
      if (alertFilterNotifier.value) {
        for (var node in _fullTree) {
          for (var item in node.alertChildren) {
            if (!items.contains(item)) {
              items.add(item);
            }
          }
        }
      }

      _buildTree(items);
    }
  }
}
