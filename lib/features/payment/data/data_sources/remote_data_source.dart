import 'package:payment_app/core/utils/api_keys.dart';
import 'package:payment_app/core/utils/api_service.dart';
import 'package:payment_app/features/payment/data/models/payment_intent/payment_intent.dart';
import 'package:payment_app/features/payment/data/models/stripe_customer_model/stripe_customer_model.dart';
import 'package:payment_app/features/payment/domain/entities/input_payment_intent_entity.dart';
import 'package:payment_app/features/payment/domain/entities/payment_intent_entity.dart';
import 'package:payment_app/features/payment/domain/entities/strip_customer_entity.dart';
import 'package:payment_app/features/payment/domain/entities/strip_cutomer_input_entity.dart';

abstract class RemoteDataSource {
  Future<PaymentIntentEntity> createPaymentIntent(
      InputPaymentIntentEntity inputPaymentIntentEntity);
  Future<StripeCustomerEntity> createCustomer(
      StripeCustomerInputEntity stripeCustomerInputEntity);
  Future<String> getEphemeralKey(String customerId);
}

class RemoteDataSourceImpl extends RemoteDataSource {
  final ApiService apiService;

  RemoteDataSourceImpl(this.apiService);
  @override
  Future<PaymentIntentEntity> createPaymentIntent(
      InputPaymentIntentEntity inputPaymentIntentEntity) async {
    Map<String, dynamic> data = await apiService.post(
        "payment_intents", inputPaymentIntentEntity.toJson(),
        token: ApiKeys.secretKey);
    PaymentIntentEntity paymentIntentEntity = PaymentIntent.fromJson(data);
    return paymentIntentEntity;
  }

  @override
  Future<StripeCustomerEntity> createCustomer(
      StripeCustomerInputEntity stripeCustomerInputEntity) async {
    Map<String, dynamic> dateResponse = await apiService.post(
        "customers", stripeCustomerInputEntity.toJson(),
        token: ApiKeys.secretKey);
    StripeCustomerEntity stripeCustomerEntity =
        StripeCustomerModel.fromJson(dateResponse);
    return stripeCustomerEntity;
  }

  @override
  Future<String> getEphemeralKey(customerId) async {
    Map<String, dynamic> dateResponse = await apiService.post(
      headers: {
        "Stripe-Version": "2024-10-28.acacia",
        "Authorization": "Bearer ${ApiKeys.secretKey}"
      },
      "ephemeral_keys",
      {"customer": customerId},
    );

    return dateResponse["secret"];
  }
}
