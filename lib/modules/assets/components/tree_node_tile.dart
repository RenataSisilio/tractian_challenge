import 'package:flutter/material.dart';

import '../../../core/theme/tractian_icons.dart';
import '../../../core/utils/typedefs/tree_node.dart';
import '../../../models/asset.dart';
import '../../../models/location.dart';
import '../asset_controller.dart';

class TreeNodeTile extends StatelessWidget {
  const TreeNodeTile(
    this.node, {
    super.key,
    required AssetController controller,
  }) : _controller = controller;

  final TreeNode node;
  final AssetController _controller;

  @override
  Widget build(BuildContext context) {
    final isExpanded = ValueNotifier(true);
    return Padding(
      padding: const EdgeInsets.all(4),
      child: ValueListenableBuilder(
        valueListenable: isExpanded,
        builder: (context, value, _) => Column(
          children: [
            InkWell(
              onTap: () => node.hasChildren
                  ? isExpanded.value = !value
                  : _controller.findChildren(node),
              child: Row(
                children: [
                  SizedBox(
                    height: 24,
                    width: 24,
                    child: node.hasChildren
                        ? AnimatedRotation(
                            turns: value ? 0 : -0.25,
                            duration: Durations.short4,
                            child: const Icon(
                              TractianIcons.chevronDown,
                              size: 10,
                            ),
                          )
                        : null,
                  ),
                  IconTheme(
                    data: IconThemeData(
                      color: Theme.of(context).colorScheme.surfaceContainer,
                      size: 22,
                    ),
                    child: switch (node.item) {
                      Location() => const Icon(TractianIcons.location),
                      Asset() => Icon((node.item as Asset).isComponent
                          ? TractianIcons.component
                          : TractianIcons.asset),
                      _ => const SizedBox.shrink(),
                    },
                  ),
                  const SizedBox(width: 4),
                  Flexible(child: Text(node.item.name)),
                  if (node.item is Asset && (node.item as Asset).isEnergySensor)
                    const _EnergySensorIndicator(),
                  if (node.item is Asset && (node.item as Asset).hasAlert)
                    const _AlertIndicator(),
                ],
              ),
            ),
            if (value)
              ...node.children.map(
                (e) => Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: TreeNodeTile(e, controller: _controller),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _EnergySensorIndicator extends StatelessWidget {
  const _EnergySensorIndicator();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 4),
      child: Icon(
        TractianIcons.boltFilled,
        size: 12,
        color: Color(0xFF52C41A),
      ),
    );
  }
}

class _AlertIndicator extends StatelessWidget {
  const _AlertIndicator();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8,
      width: 8,
      margin: const EdgeInsets.only(left: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFED3833),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
