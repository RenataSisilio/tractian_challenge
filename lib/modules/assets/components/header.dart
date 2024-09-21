import 'package:flutter/material.dart';

import '../../../core/theme/tractian_icons.dart';
import '../asset_controller.dart';
import 'filter.dart';

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
            focusNode: _controller.searchFocusNode,
            controller: _controller.searchController,
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
                notifier: _controller.energyFilterNotifier,
                label: 'Sensor de Energia',
                icon: TractianIcons.bolt,
                onChange: _controller.applyFilters,
              ),
              Filter(
                notifier: _controller.alertFilterNotifier,
                label: 'Crítico',
                icon: TractianIcons.critical,
                onChange: _controller.applyFilters,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
