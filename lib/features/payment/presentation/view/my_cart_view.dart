import 'package:flutter/material.dart';
import 'package:payment_app/core/widgets/build_app_bar.dart';
import 'package:payment_app/features/payment/presentation/view/widgets/my_cart_view_body.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, "My Cart"),
      body: const MyCartViewBody(),
    );
  }
}
