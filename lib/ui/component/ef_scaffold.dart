import 'package:ecommerce_flutter/ui/component/ef_loading.dart';
import 'package:flutter/material.dart';

class EFScaffold extends StatelessWidget {
  const EFScaffold({
    required this.isLoading,
    required this.body,
    super.key,
    this.appBar,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.drawer,
    this.endDrawer,
    this.backgroundColor,
    this.loadingMessage,
    this.extendBodyBehindAppBar = false,
  });

  final bool isLoading;
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final Widget? bottomSheet;
  final Widget? drawer;
  final Widget? endDrawer;
  final Color? backgroundColor;
  final String? loadingMessage;
  final bool extendBodyBehindAppBar;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: appBar,
          body: body,
          floatingActionButton: floatingActionButton,
          bottomNavigationBar: bottomNavigationBar,
          bottomSheet: bottomSheet,
          drawer: drawer,
          endDrawer: endDrawer,
          backgroundColor: backgroundColor,
          extendBodyBehindAppBar: extendBodyBehindAppBar,
        ),

        EfLoading(isLoading: isLoading),
      ],
    );
  }
}
