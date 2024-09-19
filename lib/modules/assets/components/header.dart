import 'package:flutter/material.dart';
import 'package:tractian_challenge/core/theme/tractian_icons.dart';
import 'package:tractian_challenge/modules/assets/asset_controller.dart';
import 'package:tractian_challenge/modules/assets/components/filter.dart';

class Header extends StatelessWidget {
  const Header(this._controller, {super.key});

  final AssetController _controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            decoration: const InputDecoration(
              prefixIcon: Icon(TractianIcons.search, size: 12.5),
              hintText: 'Buscar Ativo ou Local',
            ),
            onChanged: _controller.filterByName,
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: [
              Filter(
                label: 'Sensor de Energia',
                icon: TractianIcons.bolt,
                onChange: _controller.filterEnergySensor,
              ),
              Filter(
                label: 'Crítico',
                icon: TractianIcons.critical,
                onChange: _controller.filterCritical,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
