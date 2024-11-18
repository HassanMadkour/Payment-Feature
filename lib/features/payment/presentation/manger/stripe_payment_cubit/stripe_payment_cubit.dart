import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/features/payment/domain/entities/input_payment_intent_entity.dart';
import 'package:payment_app/features/payment/domain/entities/transaction_done_entity.dart';
import 'package:payment_app/features/payment/domain/use_cases/make_stripe_payment_use_case.dart';

part 'stripe_payment_state.dart';

class StripePaymentCubit extends Cubit<StripePaymentState> {
  final MakePaymentUseCase createPaymentIntentUseCase;
  StripePaymentCubit(this.createPaymentIntentUseCase)
      : super(StripePaymentInitial());

  Future<void> execute(
      InputPaymentIntentEntity inputPaymentIntentEntity) async {
    emit(StripePaymentLoading());
    var result =
        await createPaymentIntentUseCase.call(inputPaymentIntentEntity);
    result.fold((l) {
      emit(StripePaymentFailure(errMess: l.errMess));
    }, (r) => emit(StripePaymentSuccess(r)));
  }
}
