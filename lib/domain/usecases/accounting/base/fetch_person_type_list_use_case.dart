import 'package:toolo_gostar/domain/entities/base/person_type.dart';
import 'package:toolo_gostar/domain/repositories/accounting/account_repository.dart';

class FetchPersonTypeListUseCase {
  final IAccountingRepository _repository;

  FetchPersonTypeListUseCase(this._repository);

  @override
  Future<List<PersonType>> call() async {
    return _repository.fetchPersonTypeList();
  }
}
