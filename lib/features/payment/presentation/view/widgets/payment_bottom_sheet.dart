import 'package:flutter/material.dart';

import 'package:payment_app/features/payment/presentation/view/widgets/builder_payment_button.dart';
import 'package:payment_app/features/payment/presentation/view/widgets/payment_ways_list.dart';

class PaymentBottomSheet extends StatefulWidget {
  const PaymentBottomSheet({
    super.key,
  });

  @override
  State<PaymentBottomSheet> createState() => _PaymentBottomSheetState();
}

class _PaymentBottomSheetState extends State<PaymentBottomSheet> {
  int selectedWay = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20),
          PaymentWaysList(
            onSelected: (selectedWay) {
              setState(() {
                this.selectedWay = selectedWay;
              });
            },
          ),
          const SizedBox(height: 20),
          BuilderPaymentButton(selectedWay: selectedWay)
        ],
      ),
    );
  }
}
