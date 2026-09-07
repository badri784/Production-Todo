import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pro_todo/core/servise/login_service/login_repo.dart';
import 'package:pro_todo/core/servise/login_service/login_service.dart';

final getIt = GetIt.instance;

Future<void> setupDependanceInjection() async {
  Dio dio = Dio();

  getIt.registerLazySingleton<LoginService>(() => LoginRepo());
  dio.options.connectTimeout = const Duration(seconds: 10);
  dio.options.receiveTimeout = const Duration(seconds: 10);
}
