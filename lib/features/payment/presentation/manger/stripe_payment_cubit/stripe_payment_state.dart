part of 'stripe_payment_cubit.dart';

sealed class StripePaymentState {}

final class StripePaymentInitial extends StripePaymentState {}

final class StripePaymentSuccess extends StripePaymentState {
  StripePaymentSuccess(this.transactionDoneEntity);
  final TransactionDoneEntity transactionDoneEntity;
}

final class StripePaymentFailure extends StripePaymentState {
  final String errMess;

  StripePaymentFailure({required this.errMess});
}

final class StripePaymentLoading extends StripePaymentState {}
