import 'package:dartz/dartz.dart';
import 'package:payment_app/core/utils/errors/failure.dart';
import 'package:payment_app/core/utils/use_cases/use_case.dart';
import 'package:payment_app/features/payment/domain/entities/strip_customer_entity.dart';
import 'package:payment_app/features/payment/domain/entities/strip_cutomer_input_entity.dart';
import 'package:payment_app/features/payment/domain/repo/payment_repo.dart';

class CreateStripeCustomerUseCase extends UseCase<
    Future<Either<Failure, StripeCustomerEntity>>, StripeCustomerInputEntity> {
  final PaymentRepo paymentRepo;

  CreateStripeCustomerUseCase(this.paymentRepo);
  @override
  Future<Either<Failure, StripeCustomerEntity>> call(
      StripeCustomerInputEntity parm) {
    return paymentRepo.createStripeCustomer(parm);
  }
}
