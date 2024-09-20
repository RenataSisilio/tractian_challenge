import 'package:flutter/material.dart';

import '../../../core/theme/tractian_icons.dart';
import '../../../core/utils/typedefs/tree_node.dart';
import '../../../models/asset.dart';
import '../../../models/location.dart';

class TreeNodeTile extends StatelessWidget {
  const TreeNodeTile(this.node, {super.key});

  final TreeNode node;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Column(
        children: [
          InkWell(
            // TODO: show/hide children and transform icon
            onTap: () {},
            child: Row(
              children: [
                SizedBox(
                  height: 24,
                  width: 24,
                  child: node.hasChildren
                      ? const Icon(TractianIcons.chevronDown, size: 10)
                      : null,
                ),
                IconTheme(
                  data: IconThemeData(
                    color: Theme.of(context).colorScheme.surfaceContainer,
                    size: 22,
                  ),
                  child: switch (node.item) {
                    Location() => const Icon(TractianIcons.location),
                    Asset() => Icon((node.item as Asset).sensorType == null
                        ? TractianIcons.asset
                        : TractianIcons.component),
                    _ => const SizedBox.shrink(),
                  },
                ),
                const SizedBox(width: 4),
                Flexible(child: Text(node.item.name)),
              ],
            ),
          ),
          ...node.children.map(
            (e) => Padding(
              padding: const EdgeInsets.only(left: 16),
              child: TreeNodeTile(e),
            ),
          ),
        ],
      ),
    );
  }
}
