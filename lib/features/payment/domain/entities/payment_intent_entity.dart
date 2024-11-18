class PaymentIntentEntity {
  final int paymentAmount;
  final String paymentID;
  final String paymentClientSecret;
  final String customerId;
  final String? chargeID;
  final DateTime paymentTime;

  PaymentIntentEntity(
      {required this.paymentAmount,
      required this.paymentTime,
      this.chargeID,
      required this.customerId,
      required this.paymentID,
      required this.paymentClientSecret});
}
