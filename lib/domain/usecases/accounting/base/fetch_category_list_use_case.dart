import 'package:toolo_gostar/domain/entities/base/category.dart';

import '../../../repositories/accounting/accounting_repository.dart';

class FetchCategoryListUseCase {
  final IAccountingRepository _repository;

  FetchCategoryListUseCase(this._repository);

  @override
  Future<List<CategoryModel>> call() async {
    return _repository.fetchCategoryList();
  }
}
