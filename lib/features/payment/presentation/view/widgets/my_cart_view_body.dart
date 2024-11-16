import 'package:flutter/material.dart';
import 'package:payment_app/core/utils/app_images.dart';
import 'package:payment_app/features/payment/presentation/view/widgets/price_section.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        children: [
          Expanded(
            child: SizedBox(
              child: Image.asset(
                AppImages.imagesBasket,
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(height: 20),
          const PriceSection(),
        ],
      ),
    );
  }
}
