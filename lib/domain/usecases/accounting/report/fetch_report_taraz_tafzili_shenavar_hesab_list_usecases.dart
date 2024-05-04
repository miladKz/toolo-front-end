import 'package:toolo_gostar/domain/entities/accounting/reports/body/report_taraz_tafzili_shebavar_hesab_body.dart';
import 'package:toolo_gostar/domain/entities/accounting/reports/report_taraz_tafzili_shenavar_hesab.dart';

import '../../../repositories/accounting/accounting_repository.dart';

class FetchReportTarazTafziliShenavarHesabListUseCase {
  final IAccountingRepository _repository;

  FetchReportTarazTafziliShenavarHesabListUseCase(this._repository);


  @override
  Future<ReportTarazTafziliShenavarHesab> call({required ReportTarazTafziliShenavarHesabBody body}) async {
    return _repository.fetchReportTarazTafziliShenavarHesab(body);
  }
}
