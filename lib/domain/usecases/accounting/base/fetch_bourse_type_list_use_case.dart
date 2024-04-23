import 'package:toolo_gostar/domain/entities/base/bourse_type.dart';
import 'package:toolo_gostar/domain/repositories/accounting/account_repository.dart';

class FetchBourseTypeListUseCase {
  final IAccountingRepository _repository;

  FetchBourseTypeListUseCase(this._repository);

  @override
  Future<List<BursType>> call() async {
    return _repository.fetchBourseTypeList();
  }
}
