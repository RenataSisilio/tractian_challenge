import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/views/error_view.dart';
import '../../core/views/loading_view.dart';
import 'components/company_tile.dart';
import 'home_controller.dart';
import 'home_states.dart';

class HomePage extends StatelessWidget {
  const HomePage(this._controller, {super.key});

  final HomeController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeController, HomeState>(
        bloc: _controller,
        builder: (context, state) => switch (state) {
          LoadingHomeState() => const LoadingView(),
          ErrorHomeState() => ErrorView(state.error.message),
          SuccessHomeState() => RefreshIndicator(
              onRefresh: _controller.reload,
              child: ListView.builder(
                itemCount: state.companies.length,
                itemBuilder: (context, index) =>
                    CompanyTile(state.companies[index]),
              ),
            ),
        },
      ),
    );
  }
}
