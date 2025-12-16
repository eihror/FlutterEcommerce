import 'package:ecommerce_flutter/core/mixin/text_localization_mixin.dart';
import 'package:flutter/material.dart';

class EfSectionTitle extends StatelessWidget with TextLocalizationMixin {
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
              textLocalization.ui.buttonViewAll,
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
        ],
      ],
    );
  }
}
