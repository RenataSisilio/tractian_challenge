import 'package:flutter/material.dart';

class Filter extends StatelessWidget {
  const Filter({
    super.key,
    required this.label,
    required this.icon,
    required this.onChange,
  });

  final String label;
  final IconData icon;
  final void Function(bool) onChange;

  @override
  Widget build(BuildContext context) {
    final notifier = ValueNotifier(false);

    return ValueListenableBuilder(
      valueListenable: notifier,
      builder: (context, value, child) => FilterChip(
        showCheckmark: false,
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 14,
              color: value ? Theme.of(context).colorScheme.surface : null,
            ),
            const SizedBox(width: 6),
            Text(label),
          ],
        ),
        selected: value,
        labelStyle: TextStyle(
          color: value ? Theme.of(context).colorScheme.surface : null,
        ),
        onSelected: (value) {
          notifier.value = value;
          onChange(value);
        },
      ),
    );
  }
}
