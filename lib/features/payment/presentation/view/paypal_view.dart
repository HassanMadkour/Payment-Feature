import "dart:developer";

import "package:flutter/material.dart";
import "package:flutter_paypal_payment/flutter_paypal_payment.dart";
import "package:go_router/go_router.dart";
import "package:payment_app/core/utils/api_keys.dart";
import "package:payment_app/core/utils/app_router.dart";
import "package:payment_app/features/payment/domain/entities/transaction_paypal_entity/transaction_paypal_entity.dart";

class PaypalView extends StatelessWidget {
  const PaypalView({super.key, required this.transactionPaypalEntity});
  final TransactionPaypalEntity transactionPaypalEntity;

  @override
  Widget build(BuildContext context) {
    return PaypalCheckoutView(
      sandboxMode: true,
      clientId: ApiKeys.paypalClientID,
      secretKey: ApiKeys.paypalSecretKey,
      transactions: [transactionPaypalEntity.toJson()],
      note: "Contact us for any questions on your order.",
      onSuccess: (Map params) async {
        log("onSuccess: $params");
        GoRouter.of(context).pushReplacement(AppRouter.transactionDone);
      },
      onError: (error) {
        log("onError: $error");
        Navigator.pop(context);
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Something went wrong try again")));
      },
      onCancel: () {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Transaction Cancelled")));
      },
    );
  }
}
