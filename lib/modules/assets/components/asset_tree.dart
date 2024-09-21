import 'package:flutter/material.dart';

import '../../../core/utils/typedefs/tree_node.dart';
import '../asset_controller.dart';
import 'tree_node_tile.dart';

class AssetTree extends StatelessWidget {
  const AssetTree({
    super.key,
    required this.tree,
    required AssetController controller,
  }) : _controller = controller;

  final List<TreeNode> tree;
  final AssetController _controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: tree.length,
        itemBuilder: (context, index) => TreeNodeTile(
          tree[index],
          controller: _controller,
        ),
      ),
    );
  }
}
