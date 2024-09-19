import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  const ErrorView(this.errorMessage, {super.key});

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorMessage,
        textAlign: TextAlign.center,
      ),
    );
  }
}
