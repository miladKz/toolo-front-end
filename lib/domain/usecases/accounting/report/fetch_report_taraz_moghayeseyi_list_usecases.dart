import 'package:toolo_gostar/domain/entities/accounting/reports/body/report_taraz_moghayeseyi_body.dart';
import 'package:toolo_gostar/domain/entities/accounting/reports/report_taraz_moghayeseyi.dart';

import '../../../repositories/accounting/accounting_repository.dart';

class FetchReportTarazMoghayeseyiListUseCase {
  final IAccountingRepository _repository;

  FetchReportTarazMoghayeseyiListUseCase(this._repository);


  @override
  Future<ReportTarazMoghayeseyi> call({required ReportTarazMoghayeseyiBody body}) async {
    return _repository.fetchReportTarazMoghayeseyi(body);
  }
}
