class PaymentIntentEntity {
  final int paymentAmount;
  final String paymentID;
  final String paymentClientSecret;
  final String customerId;

  PaymentIntentEntity(
      {required this.paymentAmount,
      required this.customerId,
      required this.paymentID,
      required this.paymentClientSecret});
}
