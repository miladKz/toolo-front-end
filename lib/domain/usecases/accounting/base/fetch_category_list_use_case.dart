import 'package:toolo_gostar/domain/entities/base/category.dart';
import 'package:toolo_gostar/domain/repositories/accounting/account_repository.dart';

class FetchCategoryListUseCase {
  final IAccountingRepository _repository;

  FetchCategoryListUseCase(this._repository);

  @override
  Future<List<CategoryModel>> call() async {
    return _repository.fetchCategoryList();
  }
}
