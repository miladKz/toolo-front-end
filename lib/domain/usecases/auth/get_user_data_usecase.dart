import 'package:toolo_gostar/domain/entities/auth/user_data.dart';
import 'package:toolo_gostar/domain/repositories/auth/auth_repository.dart';

class GetUserDataUseCase {
  final AuthRepository _repository;

  GetUserDataUseCase(this._repository);

  @override
  UserData call() {
    return _repository.getUserData();
  }
}
