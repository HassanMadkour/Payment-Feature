import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:payment_app/core/utils/api_service.dart';
import 'package:payment_app/features/payment/data/data_sources/remote_data_source.dart';
import 'package:payment_app/features/payment/data/repo_impl/payment_repo_impl.dart';
import 'package:payment_app/features/payment/domain/repo/payment_repo.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<PaymentRepo>(
      PaymentRepoImpl(RemoteDataSourceImpl(ApiService(Dio()))));
}
