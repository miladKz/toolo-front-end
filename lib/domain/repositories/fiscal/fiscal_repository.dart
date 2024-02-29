import '../../entities/auth/fiscal/fiscal_year.dart';

abstract class FiscalRepository {
  Future<List<FiscalYear>> getFiscalYearData();
}
