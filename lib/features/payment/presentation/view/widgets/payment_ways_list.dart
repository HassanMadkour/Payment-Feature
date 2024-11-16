import 'package:flutter/material.dart';
import 'package:payment_app/core/utils/app_images.dart';
import 'package:payment_app/features/payment/presentation/view/widgets/payment_way.dart';

class PaymentWaysList extends StatefulWidget {
  const PaymentWaysList({
    super.key,
    required this.onSelected,
  });
  final void Function(int selectedWay) onSelected;

  @override
  State<PaymentWaysList> createState() => _PaymentWaysListState();
}

class _PaymentWaysListState extends State<PaymentWaysList> {
  int selectedWay = 0;
  final List<String> ways = [
    AppImages.imagesCard,
    AppImages.imagesPaypal,
    AppImages.imagesApplePay
  ];
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: ways
            .asMap()
            .entries
            .map((e) => GestureDetector(
                onTap: () {
                  setState(() {
                    selectedWay = e.key;
                    widget.onSelected(selectedWay);
                  });
                },
                child:
                    PaymentWay(image: e.value, isActive: selectedWay == e.key)))
            .toList());
  }
}
