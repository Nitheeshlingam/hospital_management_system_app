import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeCarousel extends StatefulWidget {
  const HomeCarousel({super.key});

  @override
  State<HomeCarousel> createState() => _HomeCarouselState();
}

class _HomeCarouselState extends State<HomeCarousel> {
  int currentIndex = 0;
  final CarouselSliderController indicatorController =
      CarouselSliderController();
  final List<String> images = [
    'assets/images/img1.jpg',
    'assets/images/img2.jpg',
    'assets/images/img3.jpg',
    'assets/images/img4.jpg',
  ];
  final List<Text> overlayButtonNames = [
    Text('Book Now'),
    Text('Contact Us'),
    Text('Rate Us'),
    Text('Learn More'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          carouselController: indicatorController,
          options: CarouselOptions(
            height: 200.0,
            autoPlay: true,
            enableInfiniteScroll: true,
            enlargeCenterPage: true,
            onPageChanged:
                (index, reason) => {
                  setState(() {
                    currentIndex = index;
                  }),
                },
            autoPlayInterval: Duration(seconds: 3),
          ),
          items:
              images.asMap().entries.map((entry) {
                int key = entry.key;
                String path = entry.value;
                return Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        path,
                        fit: BoxFit.cover,
                        width: 1000,
                        height: 300,
                      ),
                    ),
                    Positioned(
                      top: 115,
                      left: 105,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF2ECC71),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        child: overlayButtonNames[key],
                      ),
                    ),
                  ],
                );
              }).toList(),
        ),
        SizedBox(height: 10.0),
        AnimatedSmoothIndicator(
          activeIndex: currentIndex,
          count: images.length,
          effect: ExpandingDotsEffect(
            activeDotColor: Color(0xFF2ECC71),
            dotHeight: 8,
            dotWidth: 8,
          ),
        ),
      ],
    );
  }
}
