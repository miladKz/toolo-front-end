import 'package:toolo_gostar/domain/repositories/auth/auth_repository.dart';

class GetTokenUseCase {
  final AuthRepository _repository;

  GetTokenUseCase(this._repository);

  @override
  String call() {
    return _repository.getToken();
  }
}
