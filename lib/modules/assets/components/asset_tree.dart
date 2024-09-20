import 'package:flutter/material.dart';

import '../../../core/utils/typedefs/tree_node.dart';
import 'tree_node_tile.dart';

class AssetTree extends StatelessWidget {
  const AssetTree({
    super.key,
    required this.tree,
  });

  final List<TreeNode> tree;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: tree.length,
        itemBuilder: (context, index) => TreeNodeTile(tree[index]),
      ),
    );
  }
}
