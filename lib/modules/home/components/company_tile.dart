import 'package:flutter/material.dart';

import '../../../core/routes/routes.dart';
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
      child: SizedBox(
        height: 120,
        width: double.infinity,
        child: Center(
          child: Text(_company.name),
        ),
      ),
    );
  }
}
