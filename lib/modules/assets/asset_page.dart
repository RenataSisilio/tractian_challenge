import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/views/error_view.dart';
import '../../core/views/loading_view.dart';
import 'asset_controller.dart';
import 'asset_states.dart';

class AssetPage extends StatelessWidget {
  const AssetPage(this._controller, {super.key, required this.companyId});

  final AssetController _controller;
  final String companyId;

  @override
  Widget build(BuildContext context) {
    _controller.loadFrom(companyId);
    return Scaffold(
      body: BlocBuilder<AssetController, AssetState>(
        bloc: _controller,
        builder: (context, state) => switch (state) {
          LoadingAssetState() => const LoadingView(),
          ErrorAssetState() => ErrorView(state.error.message),
          SuccessAssetState() => ListView.builder(
              itemCount: state.assets.length,
              itemBuilder: (context, index) => Text(state.assets[index].name),
            ),
        },
      ),
    );
  }
}
