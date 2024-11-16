import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_app/core/utils/errors/failure.dart';
import 'package:payment_app/core/utils/errors/server_failure.dart';
import 'package:payment_app/core/utils/errors/stripe_error.dart';
import 'package:payment_app/features/payment/data/data_sources/remote_data_source.dart';
import 'package:payment_app/features/payment/domain/entities/input_payment_intent_entity.dart';
import 'package:payment_app/features/payment/domain/entities/payment_intent_entity.dart';
import 'package:payment_app/features/payment/domain/entities/strip_customer_entity.dart';
import 'package:payment_app/features/payment/domain/entities/strip_cutomer_input_entity.dart';
import 'package:payment_app/features/payment/domain/repo/payment_repo.dart';

class PaymentRepoImpl extends PaymentRepo {
  final RemoteDataSource remoteDataSource;

  PaymentRepoImpl(this.remoteDataSource);
  @override
  Future<Either<Failure, void>> makeStripePayment(
      InputPaymentIntentEntity inputPaymentIntentEntity) async {
    try {
      await stripePayment(inputPaymentIntentEntity);
      return right(null);
    } on DioException catch (e) {
      return left(ServerFailure.dioException(e));
    } on StripeException catch (e) {
      return left(StripeFailure(errMess: e.error.message ?? "Stripe Error"));
    } catch (e) {
      return left(ServerFailure(errMess: e.toString()));
    }
  }

  Future<void> stripePayment(
      InputPaymentIntentEntity inputPaymentIntentEntity) async {
    PaymentIntentEntity paymentIntentEntity =
        await remoteDataSource.createPaymentIntent(inputPaymentIntentEntity);
    print(inputPaymentIntentEntity.customerId);
    print("------------------------");
    String? ephemeralKey = inputPaymentIntentEntity.customerId != null
        ? await remoteDataSource
            .getEphemeralKey(inputPaymentIntentEntity.customerId!)
        : null;
    print(ephemeralKey);
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
      merchantDisplayName: 'Me',
      paymentIntentClientSecret: paymentIntentEntity.paymentClientSecret,
      customerEphemeralKeySecret: ephemeralKey,
      customerId: inputPaymentIntentEntity.customerId,
    ));

    await Stripe.instance.presentPaymentSheet();
  }

  @override
  Future<Either<Failure, StripeCustomerEntity>> createStripeCustomer(
      StripeCustomerInputEntity stripeCustomerInputEntity) async {
    try {
      StripeCustomerEntity stripeCustomerEntity =
          await remoteDataSource.createCustomer(stripeCustomerInputEntity);
      return right(stripeCustomerEntity);
    } on DioException catch (e) {
      return left(ServerFailure.dioException(e));
    } on StripeException catch (e) {
      return left(StripeFailure(errMess: e.error.message!));
    } catch (e) {
      return left(ServerFailure(errMess: e.toString()));
    }
  }
}
