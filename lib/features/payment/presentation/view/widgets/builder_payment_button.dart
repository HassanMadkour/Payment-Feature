import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:payment_app/core/utils/app_router.dart';
import 'package:payment_app/core/widgets/custom_button.dart';
import 'package:payment_app/features/payment/domain/entities/input_payment_intent_entity.dart';
import 'package:payment_app/features/payment/domain/entities/transaction_paypal_entity/amount.dart';
import 'package:payment_app/features/payment/domain/entities/transaction_paypal_entity/details.dart';
import 'package:payment_app/features/payment/domain/entities/transaction_paypal_entity/item.dart';
import 'package:payment_app/features/payment/domain/entities/transaction_paypal_entity/item_list.dart';
import 'package:payment_app/features/payment/domain/entities/transaction_paypal_entity/transaction_paypal_entity.dart';
import 'package:payment_app/features/payment/presentation/manger/stripe_payment_cubit/stripe_payment_cubit.dart';

class BuilderPaymentButton extends StatelessWidget {
  const BuilderPaymentButton({
    super.key,
    required this.selectedWay,
  });
  final int selectedWay;
  @override
  Widget build(BuildContext context) {
    print("selecteway index = $selectedWay");
    return BlocConsumer<StripePaymentCubit, StripePaymentState>(
      listener: (context, state) {
        if (state is StripePaymentSuccess) {
          Navigator.pop(context);
          GoRouter.of(context).push(AppRouter.transactionDone);
        }
        if (state is StripePaymentFailure) {
          Navigator.pop(context);

          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errMess)));
        }
      },
      builder: (context, state) {
        return CustomButton(
          isLoading: state is StripePaymentLoading,
          text: "Pay",
          onPressed: () {
            if (selectedWay == 0) {
              stripePaymentDo(context);
            } else {
              context.go(AppRouter.paypalView,
                  extra: TransactionPaypalEntity(
                      amount: getAmount(),
                      description: "Description",
                      itemList: getListOfItems()));
            }
          },
        );
      },
    );
  }

  ItemList getListOfItems() {
    return ItemList(items: [
      Item(currency: "USD", name: "x", price: "20", quantity: 1),
      Item(currency: "USD", name: "x", price: "30", quantity: 1),
    ]);
  }

  Amount getAmount() {
    return Amount(
        currency: "USD",
        details: Details(shipping: '0', shippingDiscount: 0, subtotal: '50'),
        total: '50');
  }

  void stripePaymentDo(BuildContext context) {
    BlocProvider.of<StripePaymentCubit>(context).execute(
        InputPaymentIntentEntity(
            amount: 2000, currency: 'usd', customerId: "cus_RDdNwt33eDaZFs"));
  }
}
