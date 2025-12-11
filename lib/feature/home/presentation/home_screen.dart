import 'package:ecommerce_flutter/core/mixin/text_localization_mixin.dart';
import 'package:ecommerce_flutter/ui/component/ef_scaffold.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeView();
}

class _HomeView extends State<HomeScreen> with TextLocalizationMixin {
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
      body: SafeArea(
        child: PageView(
          controller: _pageViewController,
          physics: const NeverScrollableScrollPhysics(),
          children: List.generate(3, (index) {
            return Center(
              child: Text('Screen ${index + 1}'),
            );
          }).toList(),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 5,
        clipBehavior: Clip.antiAlias,
        child: SizedBox(
          height: kBottomNavigationBarHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.home),
                onPressed: () {
                  _updatePage(0);
                },
              ),
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  _updatePage(1);
                },
              ),
              IconButton(
                icon: const Icon(Icons.account_circle_outlined),
                onPressed: () {
                  _updatePage(2);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
