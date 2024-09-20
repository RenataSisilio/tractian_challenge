import 'package:flutter/material.dart';

import '../../../core/theme/tractian_icons.dart';
import '../../../models/asset.dart';
import '../../../models/location.dart';
import '../../../models/named_entity.dart';

class TreeNodeTile extends StatelessWidget {
  const TreeNodeTile(this.item, {super.key});

  final NamedEntity item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Row(
        children: [
          IconTheme(
            data: IconThemeData(
              color: Theme.of(context).colorScheme.surfaceContainer,
              size: 20,
            ),
            child: switch (item) {
              Location() => const Icon(TractianIcons.location),
              Asset() => Icon((item as Asset).sensorType == null
                  ? TractianIcons.asset
                  : TractianIcons.component),
              _ => const SizedBox.shrink(),
            },
          ),
          const SizedBox(width: 4),
          Text(item.name),
        ],
      ),
    );
  }
}
