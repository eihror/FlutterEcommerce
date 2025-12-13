import 'package:ecommerce_flutter/core/mixin/text_localization_mixin.dart';
import 'package:ecommerce_flutter/feature/home/presentation/tab/home_tab.dart';
import 'package:ecommerce_flutter/ui/component/ef_app_bar.dart';
import 'package:ecommerce_flutter/ui/component/ef_bottom_bar.dart';
import 'package:ecommerce_flutter/ui/component/ef_bottom_bar_item.dart';
import 'package:ecommerce_flutter/ui/component/ef_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TextLocalizationMixin {
  int _currentIndex = 0;

  final _pageViewController = PageController();
  final _key = GlobalKey<ScaffoldState>();

  void _updatePage(int page) {
    setState(() {
      _currentIndex = page;
    });

    _pageViewController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    return EFScaffold(
      key: _key,
      isLoading: false,
      appBar: EfAppBar(
        title: Row(
          children: [
            Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  'Hi, Eihror',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  'Let´s go shopping',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(SolarIconsOutline.magnifier),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(SolarIconsOutline.bell),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(SolarIconsOutline.cart),
          ),
        ],
      ),
      body: SafeArea(
        child: PageView(
          controller: _pageViewController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            const HomeTab(),
            ...List.generate(3, (index) {
              return Center(
                child: Text('Screen ${index + 1}'),
              );
            }),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomBar(context),
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return EfBottomBar(
      height: 80,
      currentIndex: _currentIndex,
      backgroundColor: Colors.grey.shade400,
      onTap: _updatePage,
      items: [
        EfBottomBarItem(
          icon: Icon(
            _currentIndex == 0 ? SolarIconsBold.home : SolarIconsOutline.home,
            color: _currentIndex == 0 ? Colors.black : Colors.grey.shade700,
          ),
          label: 'Home',
          selectedLabelColor: Colors.black,
          unselectedLabelColor: Colors.grey.shade700,
        ),
        EfBottomBarItem(
          icon: Icon(
            _currentIndex == 1
                ? SolarIconsBold.delivery
                : SolarIconsOutline.delivery,
            color: _currentIndex == 1 ? Colors.black : Colors.grey.shade700,
          ),
          label: 'My Orders',
          selectedLabelColor: Colors.black,
          unselectedLabelColor: Colors.grey.shade700,
        ),
        EfBottomBarItem(
          icon: Icon(
            _currentIndex == 2 ? SolarIconsBold.heart : SolarIconsOutline.heart,
            color: _currentIndex == 2 ? Colors.black : Colors.grey.shade700,
          ),
          label: 'Favorite',
          selectedLabelColor: Colors.black,
          unselectedLabelColor: Colors.grey.shade700,
        ),
        EfBottomBarItem(
          icon: Icon(
            _currentIndex == 3 ? SolarIconsBold.user : SolarIconsOutline.user,
            color: _currentIndex == 3 ? Colors.black : Colors.grey.shade700,
          ),
          label: 'My profile',
          selectedLabelColor: Colors.black,
          unselectedLabelColor: Colors.grey.shade700,
        ),
      ],
    );
  }
}
