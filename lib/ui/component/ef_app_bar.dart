import 'package:flutter/material.dart';

class EfAppBar extends StatelessWidget implements PreferredSizeWidget {
  const EfAppBar({
    this.automaticallyImplyLeading = false,
    super.key,
    this.actions,
    this.leading,
    this.title,
  });

  final bool automaticallyImplyLeading;
  final Widget? leading;
  final Widget? title;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: automaticallyImplyLeading,
      leading: leading,
      title: title,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(48);
}
