import '../../../../core/usecase/usecase.dart';
import '../../../../core/utils/typedef.dart';
import '../entities/user.dart';
import '../repositories/authentication_repository.dart';

class GetUsers extends UsecaseWithoutParams<List<User>> {
  const GetUsers(this._repository);
  final AuthenticationRepository _repository;

  @override
  ResultFuture<List<User>> call() async => _repository.getUsers();
}
