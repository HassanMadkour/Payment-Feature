import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/core/utils/api_service.dart';
import 'package:payment_app/core/widgets/build_app_bar.dart';
import 'package:payment_app/features/payment/data/data_sources/remote_data_source_impl.dart';
import 'package:payment_app/features/payment/data/repo_impl/payment_repo_impl.dart';
import 'package:payment_app/features/payment/domain/entities/input_payment_intent_entity.dart';
import 'package:payment_app/features/payment/domain/use_cases/make_stripe_payment_use_case.dart';
import 'package:payment_app/features/payment/presentation/manger/stripe_payment_cubit/stripe_payment_cubit.dart';
import 'package:payment_app/features/payment/presentation/view/widgets/payment_details_body.dart';

class PaymentDetailsView extends StatelessWidget {
  const PaymentDetailsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context, "Payment Details"),
      body: BlocProvider(
        create: (context) => StripePaymentCubit(MakePaymentUseCase(
            PaymentRepoImpl(RemoteDataSourceImpl(ApiService(Dio())))))
          ..execute(InputPaymentIntentEntity(
              amount: 1000, currency: 'usd', customerId: "cus_RDdNwt33eDaZFs")),
        child: const PaymentDetailsBody(),
      ),
    );
  }
}
