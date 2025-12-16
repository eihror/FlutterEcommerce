import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class EfCarousel extends StatefulWidget {
  const EfCarousel({super.key});

  @override
  State<EfCarousel> createState() => _EfCarouselState();
}

class _EfCarouselState extends State<EfCarousel> {
  int _current = 0;

  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 170,
            enableInfiniteScroll: false,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
          carouselController: _controller,
          items: [1, 2, 3, 4, 5].map((i) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5),
              decoration: const BoxDecoration(color: Colors.amber),
              child: Center(
                child: Text(
                  'text $i',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            );
          }).toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [1, 2, 3, 4, 5].map((index) {
            final page = index - 1;
            return GestureDetector(
              onTap: () => _controller.animateToPage(page),
              child: Container(
                width: 12,
                height: 12,
                margin: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 4,
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      (Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black)
                          .withValues(
                            alpha: _current == page ? 0.9 : 0.4,
                          ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
