class InputPaymentIntentEntity {
  final double amount;
  final String currency;
  final String? customerId;

  InputPaymentIntentEntity(
      {required this.amount, required this.currency, this.customerId});

  Map<String, dynamic> toJson() {
    return {
      "amount": amount.toInt(),
      "currency": currency,
      "customer": customerId
    };
  }
}
