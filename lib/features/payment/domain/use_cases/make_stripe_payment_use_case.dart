import 'package:dartz/dartz.dart';
import 'package:payment_app/core/utils/errors/failure.dart';
import 'package:payment_app/core/utils/use_cases/use_case.dart';
import 'package:payment_app/features/payment/domain/entities/input_payment_intent_entity.dart';
import 'package:payment_app/features/payment/domain/repo/payment_repo.dart';

class MakePaymentUseCase
    extends UseCase<Future<Either<Failure, void>>, InputPaymentIntentEntity> {
  final PaymentRepo paymentRepo;

  MakePaymentUseCase(this.paymentRepo);
  @override
  Future<Either<Failure, void>> call(InputPaymentIntentEntity parm) async {
    return paymentRepo.makeStripePayment(parm);
  }
}
