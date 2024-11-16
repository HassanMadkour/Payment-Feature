import 'package:dartz/dartz.dart';
import 'package:payment_app/core/utils/errors/failure.dart';
import 'package:payment_app/features/payment/domain/entities/input_payment_intent_entity.dart';
import 'package:payment_app/features/payment/domain/entities/strip_customer_entity.dart';
import 'package:payment_app/features/payment/domain/entities/strip_cutomer_input_entity.dart';

abstract class PaymentRepo {
  Future<Either<Failure, void>> makeStripePayment(
      InputPaymentIntentEntity inputPaymentIntentEntity);
  Future<Either<Failure, StripeCustomerEntity>> createStripeCustomer(
      StripeCustomerInputEntity stripeCustomerInputEntity);
}
