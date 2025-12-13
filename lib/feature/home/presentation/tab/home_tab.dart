import 'package:ecommerce_flutter/ui/component/ef_carousel.dart';
import 'package:ecommerce_flutter/ui/component/ef_section_title.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return RefreshIndicator(
      color: Colors.white,
      backgroundColor: Colors.blue,
      onRefresh: () async {
        return Future<void>.delayed(const Duration(seconds: 3));
      },
      child: Padding(
        padding: const .all(16),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: EfCarousel(),
            ),
            SliverPadding(
              padding: const .only(top: 8),
              sliver: SliverToBoxAdapter(
                child: EfSectionTitle(
                  title: 'New Arrivals',
                  onTap: () {},
                ),
              ),
            ),
            SliverGrid.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 3 / 4,
              ),
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.teal[100 * (index % 9)],
                  child: Text('grid item $index'),
                );
              },
            ),
            const SliverPadding(
              padding: .only(top: 16),
              sliver: SliverToBoxAdapter(
                child: EfSectionTitle(
                  title: 'All Products',
                ),
              ),
            ),
            SliverGrid.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 3 / 4,
              ),
              itemCount: 20,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.amber[100 * (index % 9)],
                  child: Text('grid item $index'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
