import 'package:flutter/material.dart';
import 'package:payment_app/features/payment/presentation/view/widgets/code_bar_section.dart';
import 'package:payment_app/features/payment/presentation/view/widgets/transaction_details_section.dart';
import 'package:payment_app/features/payment/presentation/view/widgets/transaction_shape.dart';

class TransactionDoneViewBody extends StatelessWidget {
  const TransactionDoneViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const TransactionShape(
      upperSection: TransactionDetailsSection(),
      lowerSection: CodeBarSection(),
    );
  }
}
