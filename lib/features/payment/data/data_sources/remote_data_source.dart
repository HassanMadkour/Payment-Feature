import 'package:payment_app/features/payment/domain/entities/input_payment_intent_entity.dart';
import 'package:payment_app/features/payment/domain/entities/payment_intent_entity.dart';
import 'package:payment_app/features/payment/domain/entities/strip_customer_entity.dart';
import 'package:payment_app/features/payment/domain/entities/strip_cutomer_input_entity.dart';
import 'package:payment_app/features/payment/domain/entities/transaction_done_entity.dart';

abstract class RemoteDataSource {
  Future<PaymentIntentEntity> createPaymentIntent(
      InputPaymentIntentEntity inputPaymentIntentEntity);
  Future<TransactionDoneEntity> getPaymentIntent(
      PaymentIntentEntity paymentIntentEntityLocal);
  Future<StripeCustomerEntity> createCustomer(
      StripeCustomerInputEntity stripeCustomerInputEntity);
  Future<String> getEphemeralKey(String customerId);
}
