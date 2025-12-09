import 'dart:async';

import 'package:flutter/material.dart';

class EFSnackBarController {
  factory EFSnackBarController() => _instance;

  EFSnackBarController._internal();

  static final EFSnackBarController _instance =
  EFSnackBarController._internal();

  OverlayEntry? _currentEntry;
  Timer? _dismissTimer;

  void showSuccess(BuildContext context, String message) {
    _show(
      context: context,
      icon: const Icon(
        Icons.check_circle_outlined,
        size: 16,
        color: Color(0xFF24A148),
      ),
      backgroundColor: const Color(0xFFDFFFE8),
      message: message,
    );
  }

  void showError(BuildContext context, String message) {
    _show(
      context: context,
      icon: const Icon(
        Icons.cancel_outlined,
        size: 16,
        color: Color(0xFFDA1E28),
      ),
      backgroundColor: const Color(0xFFFFE7E8),
      message: message,
    );
  }

  void showInfo(BuildContext context, String message) {
    _show(
      context: context,
      icon: const Icon(
        Icons.info_outline,
        size: 16,
        color: Color(0xFF4589FF),
      ),
      backgroundColor: const Color(0xFFE7EFFF),
      message: message,
    );
  }

  void showWarning(BuildContext context, String message) {
    _show(
      context: context,
      icon: const Icon(
        Icons.warning_amber_rounded,
        size: 16,
        color: Color(0xFFFCA004),
      ),
      backgroundColor: const Color(0xFFFFF3DE),
      message: message,
    );
  }

  void _show({
    required BuildContext context,
    required Widget icon,
    required String message,
    required Color backgroundColor,
    Duration duration = const Duration(seconds: 4),
  }) {
    _dismiss();

    final overlay = Overlay.of(context);
    final key = GlobalKey<_EFSnackBarState>();

    _currentEntry = OverlayEntry(
      builder: (_) => Positioned(
        bottom: 16,
        right: 16,
        left: 16,
        child: Material(
          color: Colors.transparent,
          child: EFSnackBar(
            key: key,
            icon: icon,
            message: message,
            backgroundColor: backgroundColor,
            onDismiss: _dismiss,
          ),
        ),
      ),
    );

    overlay.insert(_currentEntry!);

    _dismissTimer?.cancel();
    _dismissTimer = Timer(duration, () {
      unawaited(key.currentState?.dismiss());
    });
  }

  void _dismiss() {
    _dismissTimer?.cancel();
    _dismissTimer = null;

    _currentEntry?.remove();
    _currentEntry = null;
  }
}

class EFSnackBar extends StatefulWidget {
  const EFSnackBar({
    required this.icon,
    required this.message,
    required this.backgroundColor,
    required this.onDismiss,
    super.key,
  });
  final Widget icon;
  final String message;
  final Color backgroundColor;
  final VoidCallback onDismiss;

  @override
  State<EFSnackBar> createState() => _EFSnackBarState();
}

class _EFSnackBarState extends State<EFSnackBar>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _offsetAnimation;

  bool _animationReady = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      reverseDuration: const Duration(milliseconds: 250),
      vsync: this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {

      _offsetAnimation = Tween<Offset>(
        begin: const Offset(0, 1),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Curves.easeOutBack,
        ),
      );

      setState(() {
        _animationReady = true;
      });

      unawaited(_controller.forward());
    });
  }

  Future<void> dismiss() async {
    await _controller.reverse();
    widget.onDismiss();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_animationReady) {
      return const SizedBox.shrink();
    }

    return SlideTransition(
      position: _offsetAnimation,
      child: Container(
        padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
        constraints: const BoxConstraints(maxWidth: 600),
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.circular(4),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8,
            ),
          ],
        ),
        child: Row(
          children: [
            widget.icon,
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                widget.message,
                maxLines: 10,
              ),
            ),
            const SizedBox(width: 16),
            InkWell(
              onTap: dismiss,
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: Icon(Icons.close, size: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
