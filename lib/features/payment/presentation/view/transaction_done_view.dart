import 'package:flutter/material.dart';
import 'package:payment_app/core/widgets/build_app_bar.dart';
import 'package:payment_app/features/payment/domain/entities/transaction_done_entity.dart';
import 'package:payment_app/features/payment/presentation/view/widgets/transaction_done_view_body.dart';

class TransactionDoneView extends StatelessWidget {
  const TransactionDoneView({
    super.key,
    required this.transactionDoneEntity,
  });
  final TransactionDoneEntity transactionDoneEntity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppBar(context),
        body: Transform.translate(
            offset: const Offset(0, 0),
            child: TransactionDoneViewBody(
              transactionDoneEntity: transactionDoneEntity,
            )));
  }
}
