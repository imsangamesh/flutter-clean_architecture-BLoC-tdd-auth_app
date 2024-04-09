import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import '../../src/authentication/data/datasources/authentication_remote_data_source.dart';
import '../../src/authentication/data/repositories/authentication_repository_impl.dart';
import '../../src/authentication/domain/repositories/authentication_repository.dart';
import '../../src/authentication/domain/usecases/create_user.dart';
import '../../src/authentication/domain/usecases/get_users.dart';
import '../../src/authentication/presentation/cubit/auth_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /* here, we need the USECASES' instances to CALL in AuthCubit...
  - So, we should get them from constructor... but, we should NOT go 
  and just initialize them on the spot, but rather INJECT them by SL.
  - It automatically finds that particular instance and INJECTS where needed.
  */

  sl
    // App Logic
    ..registerFactory(() => AuthCubit(createUser: sl(), getUsers: sl()))

    // Usecases
    ..registerLazySingleton(() => CreateUser(sl()))
    ..registerLazySingleton(() => GetUsers(sl()))

    // Repositories
    ..registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl(sl()),
    )

    // Data Sources
    ..registerLazySingleton<AuthenticationRemoteDataSource>(
      () => AuthRemoteDataSrcImpl(sl()),
    )

    // External Dependencies
    ..registerLazySingleton(http.Client.new); // i.e. () => http.Client()
}

/*

😳MG  😳MG  😳MG !!! Man, best ever explanation of dependency injection @6:39:00... My lips of totally sealed! Just WoW! I totally loved how you explain with your tenderness, kindness, and of course with fun! And, the content is a pure gem! 💎
Thank you again! 💗

*/