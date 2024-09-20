import 'package:flutter/material.dart';

import '../../../models/named_entity.dart';
import 'tree_node_tile.dart';

class AssetTree extends StatelessWidget {
  const AssetTree({
    super.key,
    required this.items,
  });

  final List<NamedEntity> items;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) => TreeNodeTile(items[index]),
      ),
    );
  }
}
