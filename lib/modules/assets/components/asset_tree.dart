import 'package:flutter/material.dart';
import 'package:tractian_challenge/models/named_entity.dart';

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
        itemBuilder: (context, index) {
          return Text(items[index].name);
        },
      ),
    );
  }
}
