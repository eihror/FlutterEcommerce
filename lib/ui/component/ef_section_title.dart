import 'package:flutter/material.dart';

class EfSectionTitle extends StatelessWidget {
  const EfSectionTitle({
    required this.title,
    this.onTap,
    super.key,
  });

  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        if (onTap != null) ...[
          const Spacer(),
          TextButton(
            onPressed: onTap,
            child: Text(
              'View all',
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
        ],
      ],
    );
  }
}
