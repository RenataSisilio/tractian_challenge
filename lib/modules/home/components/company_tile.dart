import 'package:flutter/material.dart';

import '../../../core/routes/routes.dart';
import '../../../core/theme/tractian_icons.dart';
import '../../../models/company.dart';

class CompanyTile extends StatelessWidget {
  const CompanyTile(this._company, {super.key, required});

  final Company _company;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Routes.i.pushNamed(
        Routes.assets,
        arguments: _company.id,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainer,
          borderRadius: BorderRadius.circular(5),
        ),
        height: 76,
        margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        padding: const EdgeInsets.symmetric(vertical: 26, horizontal: 32),
        width: double.infinity,
        child: Row(
          children: [
            Icon(
              TractianIcons.company,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            const SizedBox(width: 16),
            Text(
              '${_company.name} Unit',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
