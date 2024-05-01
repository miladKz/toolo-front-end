import 'package:toolo_gostar/domain/entities/base/prefix.dart';
import 'package:toolo_gostar/domain/repositories/accounting/accounting_repository.dart';

class FetchPrefixListUseCase {
  final IAccountingRepository _repository;

  FetchPrefixListUseCase(this._repository);

  @override
  Future<List<Prefix>> call() async {
    return _repository.fetchPrefixList();
  }
}
