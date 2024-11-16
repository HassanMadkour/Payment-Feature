import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class PaymentWay extends StatelessWidget {
  const PaymentWay({
    super.key,
    required this.image,
    required this.isActive,
  });
  final String image;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * .25,
      child: AspectRatio(
        aspectRatio: 104 / 62,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: isActive ? Colors.green : Colors.black,
              ),
              borderRadius: BorderRadius.circular(10)),
          child: FittedBox(child: Center(child: SvgPicture.asset(image))),
        ),
      ),
    );
  }
}
