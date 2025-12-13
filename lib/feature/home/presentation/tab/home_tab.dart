import 'package:ecommerce_flutter/ui/component/ef_carousel.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: Colors.white,
      backgroundColor: Colors.blue,
      onRefresh: () async {
        return Future<void>.delayed(const Duration(seconds: 3));
      },
      notificationPredicate: (notification) {
        return notification.depth == 1;
      },
      child: SafeArea(
        child: Padding(
          padding: const .all(16),
          child: Column(
            children: [EfCarousel()],
          ),
        ),
      ),
    );
  }
}
