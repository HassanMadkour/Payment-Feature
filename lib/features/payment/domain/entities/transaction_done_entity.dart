import 'package:intl/intl.dart';
import 'package:payment_app/features/payment/domain/entities/payment_intent_entity.dart';

class TransactionDoneEntity {
  final String totalPrice;
  final String sellerEmail;
  final String transactionDateTime;
  final String? sellerName;
  final String? cardType;
  final String? barcode;

  TransactionDoneEntity({
    required this.totalPrice,
    required this.sellerEmail,
    required this.transactionDateTime,
    this.sellerName,
    this.cardType,
    this.barcode,
  });

  // Factory method to create an instance from a Map
  factory TransactionDoneEntity.fromJsonPaypal(json) {
    final transaction = json['data']['transactions'][0];
    final relatedResource = transaction['related_resources'][0]['sale'];

    return TransactionDoneEntity(
      totalPrice: transaction['amount']['total'],
      sellerEmail: transaction['payee']['email'],
      transactionDateTime: DateFormat("hh:mm a , EEE/MM/yyyy").format(
          DateTime.parse(relatedResource['create_time'])
              .add(const Duration(hours: 2))),
      sellerName: transaction['payee']['merchant_id'],
      cardType: relatedResource['payment_mode'],
      barcode: json['data']['id'],
    );
  }
  factory TransactionDoneEntity.fromJsonStripe(
      PaymentIntentEntity paymentIntentEntity, String cardType) {
    return TransactionDoneEntity(
      totalPrice: paymentIntentEntity.paymentAmount.toString(),
      sellerEmail: "Hassan@gmail.com",
      transactionDateTime: DateFormat("hh:mm a , EEE/MM/yyyy")
          .format(paymentIntentEntity.paymentTime),
      sellerName: "Hassan Madkour",
      cardType: cardType,
      barcode: paymentIntentEntity.paymentID,
    );
  }

  // Convert instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'totalPrice': totalPrice,
      'sellerEmail': sellerEmail,
      'transactionDateTime': transactionDateTime,
      'sellerName': sellerName,
      'cardType': cardType,
      'barcode': barcode,
    };
  }
}
