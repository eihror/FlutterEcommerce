import 'package:flutter/material.dart';

class EfBottomBarItem extends StatelessWidget {
  const EfBottomBarItem({
    required this.icon,
    required this.label,
    required this.selectedLabelColor,
    required this.unselectedLabelColor,
    super.key,
    this.selected = false,
    this.onTap,
  });

  final Widget icon;
  final String label;
  final bool selected;
  final Color selectedLabelColor;
  final Color unselectedLabelColor;
  final VoidCallback? onTap;

  EfBottomBarItem copyWith({
    required Widget icon,
    String? label,
    bool? selected,
    VoidCallback? onTap,
    Color? selectedLabelColor,
    Color? unselectedLabelColor,
  }) {
    return EfBottomBarItem(
      icon: icon,
      label: label ?? this.label,
      selected: selected ?? this.selected,
      onTap: onTap ?? this.onTap,
      selectedLabelColor: selectedLabelColor ?? this.selectedLabelColor,
      unselectedLabelColor: unselectedLabelColor ?? this.unselectedLabelColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () => onTap?.call(),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              icon,
              const SizedBox(height: 4),
              Text(
                label,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: selected ? selectedLabelColor : unselectedLabelColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
