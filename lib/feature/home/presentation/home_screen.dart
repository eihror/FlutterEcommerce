import 'package:cached_network_image/cached_network_image.dart';
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
      appBar: _buildAppBar(),
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
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildBottomBar() {
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
          label: textLocalization.ui.buttonBottomBarHome,
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
          label: textLocalization.ui.buttonBottomBarMyOrders,
          selectedLabelColor: Colors.black,
          unselectedLabelColor: Colors.grey.shade700,
        ),
        EfBottomBarItem(
          icon: Icon(
            _currentIndex == 2 ? SolarIconsBold.heart : SolarIconsOutline.heart,
            color: _currentIndex == 2 ? Colors.black : Colors.grey.shade700,
          ),
          label: textLocalization.ui.buttonBottomBarFavorite,
          selectedLabelColor: Colors.black,
          unselectedLabelColor: Colors.grey.shade700,
        ),
        EfBottomBarItem(
          icon: Icon(
            _currentIndex == 3 ? SolarIconsBold.user : SolarIconsOutline.user,
            color: _currentIndex == 3 ? Colors.black : Colors.grey.shade700,
          ),
          label: textLocalization.ui.buttonBottomBarMyProfile,
          selectedLabelColor: Colors.black,
          unselectedLabelColor: Colors.grey.shade700,
        ),
      ],
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return _currentIndex == 0
        ? EfAppBar(
            title: Row(
              children: [
                CachedNetworkImage(
                  imageUrl: 'https://picsum.photos/200/200',
                  fit: .cover,
                  imageBuilder: (context, image) => CircleAvatar(
                    backgroundImage: image,
                    radius: 24,
                  ),
                  progressIndicatorBuilder: (context, url, progress) => Center(
                    child: CircularProgressIndicator(
                      value: progress.progress,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      textLocalization.ui.titleAppBarWithText('Eihror'),
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      textLocalization.ui.subTitleAppBar,
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
          )
        : AppBar(
            title: Text(textLocalization.ui.appBarMyOrders),
            centerTitle: true,
          );
  }
}
