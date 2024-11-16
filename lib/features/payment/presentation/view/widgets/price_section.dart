import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/core/utils/app_styles.dart';
import 'package:payment_app/core/utils/locator_service.dart';
import 'package:payment_app/core/widgets/custom_button.dart';
import 'package:payment_app/features/payment/domain/entities/price_entity.dart';
import 'package:payment_app/features/payment/domain/repo/payment_repo.dart';
import 'package:payment_app/features/payment/domain/use_cases/make_stripe_payment_use_case.dart';
import 'package:payment_app/features/payment/presentation/manger/stripe_payment_cubit/stripe_payment_cubit.dart';
import 'package:payment_app/features/payment/presentation/view/widgets/payment_bottom_sheet.dart';

class PriceSection extends StatelessWidget {
  const PriceSection({
    super.key,
  });
  static List<PriceEntity> prices = [
    PriceEntity(price: 50.97, title: "Order Subtotal"),
    PriceEntity(price: 0, title: "Discount"),
    PriceEntity(price: 8, title: "Shipping"),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
            children: prices
                .map((e) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(e.title, style: AppStyles.regular18),
                          Text(
                            '\$${e.price}',
                            style: AppStyles.regular18,
                          ),
                        ],
                      ),
                    ))
                .toList()),
        const Divider(),
        const ListTile(
            title: Text(
              "Total",
              style: AppStyles.semiBold24,
            ),
            trailing: Text(
              r"$50.97",
              style: AppStyles.semiBold24,
            )),
        CustomButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) => BlocProvider(
                      create: (context) => StripePaymentCubit(
                          MakePaymentUseCase(getIt.get<PaymentRepo>())),
                      child: const PaymentBottomSheet(),
                    ));
          },
          text: "Complete Payment",
        )
      ],
    );
  }
}
