import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:payment_app/core/utils/app_router.dart';
import 'package:payment_app/core/widgets/custom_button.dart';
import 'package:payment_app/features/payment/presentation/view/widgets/credit_card_and_form_view.dart';

class PaymentDetailsBody extends StatelessWidget {
  const PaymentDetailsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      // const SliverToBoxAdapter(child: PaymentWaysList()),
      const SliverToBoxAdapter(child: CreditCardAndFormView()),
      SliverFillRemaining(
        hasScrollBody: false,
        child: Column(
          children: [
            const Spacer(),
            CustomButton(
              text: "Pay",
              onPressed: () {
                GoRouter.of(context).push(AppRouter.transactionDone);
              },
            ),
          ],
        ),
      ),
    ]);
  }
}
