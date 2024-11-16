import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:payment_app/features/payment/presentation/view/widgets/card_widget.dart';

class CarouselWidgetAndIndicator extends StatefulWidget {
  const CarouselWidgetAndIndicator({
    super.key,
  });

  @override
  State<CarouselWidgetAndIndicator> createState() =>
      _CarouselWidgetAndIndicatorState();
}

class _CarouselWidgetAndIndicatorState
    extends State<CarouselWidgetAndIndicator> {
  int currentPage = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              onScrolled: (value) {
                setState(() {
                  currentPage = value!.round() % 3;
                });
              },
              aspectRatio: 295 / 150,
              enlargeFactor: .2,
              enlargeCenterPage: true),
          items: const [CardWidget(), CardWidget(), CardWidget()],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
              3,
              (index) => Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: CircleAvatar(
                      backgroundColor:
                          index == currentPage ? Colors.black : Colors.grey,
                      radius: 5,
                    ),
                  )),
        )
      ],
    );
  }
}
