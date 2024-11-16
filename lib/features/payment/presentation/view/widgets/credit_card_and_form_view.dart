import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class CreditCardAndFormView extends StatefulWidget {
  const CreditCardAndFormView({
    super.key,
  });

  @override
  State<CreditCardAndFormView> createState() => _CreditCardAndFormViewState();
}

class _CreditCardAndFormViewState extends State<CreditCardAndFormView> {
  final GlobalKey<FormState> formKey = GlobalKey();
  String cardNumber = '', expiryDate = "", cardHolderName = '', cvvCode = '';
  bool showBackView = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CreditCardWidget(
          animationDuration: const Duration(milliseconds: 500),
          isHolderNameVisible: true,
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
          cvvCode: cvvCode,
          showBackView: showBackView,
          onCreditCardWidgetChange: (creditCardBrand) {},
        ),
        CreditCardForm(
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            onCreditCardModelChange: (creditCardModel) {
              setState(() {
                cardNumber = creditCardModel.cardNumber;
                expiryDate = creditCardModel.expiryDate;
                cvvCode = creditCardModel.cvvCode;
                cardHolderName = creditCardModel.cardHolderName;
                showBackView = creditCardModel.isCvvFocused;
              });
            },
            formKey: formKey)
      ],
    );
  }
}
