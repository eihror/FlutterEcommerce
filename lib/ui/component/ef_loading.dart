import 'dart:ui';

import 'package:flutter/material.dart';

class EfLoading extends StatelessWidget {
  const EfLoading({this.isLoading = false, super.key});

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (isLoading) ...[
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 4,
                sigmaY: 4,
              ),
              child: Container(
                color: Colors.black.withValues(alpha: 0.25),
              ),
            ),
          ),

          const ModalBarrier(
            dismissible: false,
            color: Colors.transparent,
          ),
          const Center(
            child: CircularProgressIndicator(),
          ),
        ],
      ],
    );
  }
}
