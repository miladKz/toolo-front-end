import 'package:toolo_gostar/domain/entities/accounting/reports/body/report_jame_taraz_body.dart';
import 'package:toolo_gostar/domain/entities/accounting/reports/report_jame_taraz.dart';

import '../../../repositories/accounting/accounting_repository.dart';

class FetchReportJameTarazListUseCase {
  final IAccountingRepository _repository;

  FetchReportJameTarazListUseCase(this._repository);

  @override
  Future<ReportJameTaraz> call({required ReportJameTarazBody body}) async {
    return _repository.fetchReportJameTaraz(body);
  }
}
