import 'package:go_router/go_router.dart';
import 'package:payment_app/features/payment/domain/entities/transaction_done_entity.dart';
import 'package:payment_app/features/payment/domain/entities/transaction_paypal_entity/transaction_paypal_entity.dart';
import 'package:payment_app/features/payment/presentation/view/my_cart_view.dart';
import 'package:payment_app/features/payment/presentation/view/payment_details_view.dart';
import 'package:payment_app/features/payment/presentation/view/paypal_view.dart';
import 'package:payment_app/features/payment/presentation/view/transaction_done_view.dart';

class AppRouter {
  static const String cartView = "/";
  static const String paymentDetailsView = "/paymentDetailsView";
  static const String paypalView = "/paypalView";
  static const String transactionDone = "/transactionDone";
  final router = GoRouter(routes: [
    GoRoute(
      path: cartView,
      builder: (context, state) => const MyCartView(),
    ),
    GoRoute(
        path: paymentDetailsView,
        builder: (context, state) => const PaymentDetailsView()),
    GoRoute(
      path: transactionDone,
      builder: (context, state) => TransactionDoneView(
          transactionDoneEntity: state.extra as TransactionDoneEntity),
    ),
    GoRoute(
      path: paypalView,
      builder: (context, state) => PaypalView(
          transactionPaypalEntity: state.extra as TransactionPaypalEntity),
    ),
  ]);
}
