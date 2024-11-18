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
import 'package:payment_app/features/payment/domain/entities/transaction_done_entity.dart';
import 'package:payment_app/features/payment/domain/repo/payment_repo.dart';

class PaymentRepoImpl extends PaymentRepo {
  final RemoteDataSource remoteDataSource;

  PaymentRepoImpl(this.remoteDataSource);
  @override
  Future<Either<Failure, TransactionDoneEntity>> makeStripePayment(
      InputPaymentIntentEntity inputPaymentIntentEntity) async {
    try {
      TransactionDoneEntity transactionDoneEntity =
          await stripePayment(inputPaymentIntentEntity);
      return right(transactionDoneEntity);
    } on DioException catch (e) {
      return left(ServerFailure.dioException(e));
    } on StripeException catch (e) {
      return left(StripeFailure(errMess: e.error.message ?? "Stripe Error"));
    } catch (e) {
      return left(ServerFailure(errMess: e.toString()));
    }
  }

  Future<TransactionDoneEntity> stripePayment(
      InputPaymentIntentEntity inputPaymentIntentEntity) async {
    PaymentIntentEntity paymentIntentEntity =
        await remoteDataSource.createPaymentIntent(inputPaymentIntentEntity);

    String? ephemeralKey = inputPaymentIntentEntity.customerId != null
        ? await remoteDataSource
            .getEphemeralKey(inputPaymentIntentEntity.customerId!)
        : null;
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
      merchantDisplayName: 'Me',
      paymentIntentClientSecret: paymentIntentEntity.paymentClientSecret,
      customerEphemeralKeySecret: ephemeralKey,
      customerId: inputPaymentIntentEntity.customerId,
    ));

    await Stripe.instance.presentPaymentSheet();
    TransactionDoneEntity transactionDoneEntity =
        await remoteDataSource.getPaymentIntent(paymentIntentEntity);
    return transactionDoneEntity;
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
