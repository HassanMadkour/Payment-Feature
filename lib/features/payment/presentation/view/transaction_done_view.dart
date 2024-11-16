import 'package:flutter/material.dart';
import 'package:payment_app/core/widgets/build_app_bar.dart';
import 'package:payment_app/features/payment/presentation/view/widgets/transaction_done_view_body.dart';

class TransactionDoneView extends StatelessWidget {
  const TransactionDoneView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppBar(context),
        body: Transform.translate(
            offset: const Offset(0, 0),
            child: const TransactionDoneViewBody()));
  }
}
