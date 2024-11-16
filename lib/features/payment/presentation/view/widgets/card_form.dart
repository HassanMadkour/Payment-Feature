import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:payment_app/core/utils/app_router.dart';
import 'package:payment_app/core/utils/birthdate_formatter.dart';
import 'package:payment_app/core/utils/credit_card_number_formatter.dart';
import 'package:payment_app/core/widgets/custom_button.dart';
import 'package:payment_app/features/payment/presentation/view/widgets/custom_text_field.dart';

class CardForm extends StatelessWidget {
  const CardForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          inputFormatter: [
            FilteringTextInputFormatter.digitsOnly,
            CreditCardNumberFormatter()
          ],
          hint: "Card Number",
        ),
        const Row(
          children: [
            Expanded(
              child: CustomTextField(
                hint: "Name",
              ),
            ),
            SizedBox(width: 30),
            Expanded(
              child: CustomTextField(
                hint: "Card ID",
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                inputFormatter: [DateTextInputFormatter()],
                hint: "Expiration Data",
              ),
            ),
            const SizedBox(width: 30),
            Expanded(
              child: CustomTextField(
                inputFormatter: [
                  FilteringTextInputFormatter.digitsOnly, // Allows only digits
                  LengthLimitingTextInputFormatter(3),
                ],
                hint: "CVV",
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        CustomButton(
          onPressed: () {
            GoRouter.of(context).push(AppRouter.transactionDone);
          },
          text: "Pay",
        ),
      ],
    );
  }
}
