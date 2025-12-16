import 'package:ecommerce_flutter/ui/component/ef_loading.dart';
import 'package:flutter/material.dart';

class EfBodyWithLoading extends StatelessWidget {
  const EfBodyWithLoading({
    required this.child,
    this.isLoading = false,
    super.key,
  });

  final Widget child;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        EfLoading(isLoading: isLoading),
      ],
    );
  }
}
