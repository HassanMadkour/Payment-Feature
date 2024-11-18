import 'package:flutter/material.dart';
import 'package:payment_app/features/payment/domain/entities/transaction_done_entity.dart';
import 'package:payment_app/features/payment/presentation/view/widgets/code_bar_section.dart';
import 'package:payment_app/features/payment/presentation/view/widgets/transaction_details_section.dart';
import 'package:payment_app/features/payment/presentation/view/widgets/transaction_shape.dart';

class TransactionDoneViewBody extends StatelessWidget {
  const TransactionDoneViewBody({
    super.key,
    required this.transactionDoneEntity,
  });
  final TransactionDoneEntity transactionDoneEntity;

  @override
  Widget build(BuildContext context) {
    return TransactionShape(
      upperSection: TransactionDetailsSection(
          transactionDoneEntity: transactionDoneEntity),
      lowerSection: const CodeBarSection(),
    );
  }
}
