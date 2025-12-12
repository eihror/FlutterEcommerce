import 'package:ecommerce_flutter/ui/component/ef_bottom_bar_item.dart';
import 'package:flutter/material.dart';

class EfBottomBar extends StatefulWidget {
  const EfBottomBar({
    required this.items,
    this.currentIndex = 0,
    super.key,
    this.backgroundColor,
    this.content,
    this.height,
    this.onTap,
  });

  final int currentIndex;
  final double? height;
  final Color? backgroundColor;
  final void Function(int)? onTap;
  final List<Widget> items;
  final Widget? content;

  @override
  State<EfBottomBar> createState() => _EfBottomBarState();
}

class _EfBottomBarState extends State<EfBottomBar> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentIndex;
  }

  @override
  void didUpdateWidget(covariant EfBottomBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_currentIndex != widget.currentIndex) {
      setState(() {
        _currentIndex = widget.currentIndex;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          widget.content ?? const SizedBox.shrink(),
          BottomAppBar(
            height: widget.height,
            shape: const CircularNotchedRectangle(),
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ).copyWith(top: 8),
            color: widget.backgroundColor ?? Colors.grey.shade400,
            surfaceTintColor: Colors.grey.shade400,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                widget.items.length,
                (index) {
                  if (widget.items[index] is EfBottomBarItem) {
                    final item = widget.items[index] as EfBottomBarItem;
                    return item.copyWith(
                      selected: index == _currentIndex,
                      onTap: () {
                        setState(() {
                          _currentIndex = index;
                        });
                        widget.onTap?.call(index);
                      },
                      icon: item.icon,
                    );
                  } else {
                    return widget.items[index];
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
