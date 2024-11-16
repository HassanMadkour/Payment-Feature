import 'package:flutter/material.dart';
import 'package:payment_app/features/payment/presentation/view/widgets/card_form.dart';
import 'package:payment_app/features/payment/presentation/view/widgets/carousel_widget_and_indicator.dart';
import 'package:payment_app/features/payment/presentation/view/widgets/payment_ways_list.dart';

class PaymentDetailsViewBody extends StatelessWidget {
  const PaymentDetailsViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 15),
          PaymentWaysList(
            onSelected: (selectedWay) {},
          ),
          const SizedBox(height: 15),
          const CarouselWidgetAndIndicator(),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: CardForm(),
          ),
        ],
      ),
    );
  }
}
