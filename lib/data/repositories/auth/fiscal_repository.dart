import 'package:atras_data_parser/atras_data_parser.dart';
import 'package:toolo_gostar/data/common/models/server_response_dto.dart';
import 'package:toolo_gostar/data/datasources/auth/auth_local_data_source_impl.dart';
import 'package:toolo_gostar/data/models/fiscal_year/params/set_current_fiscal_year_param_dto.dart';
import 'package:toolo_gostar/domain/entities/fiscal/params/set_current_fiscal_year_param.dart';

import '../../../domain/entities/fiscal/fiscal_year.dart';
import '../../../domain/repositories/fiscal/fiscal_repository.dart';
import '../../datasources/auth/remote_data_source.dart';
import '../../models/fiscal_year/fiscal_year_dto.dart';

class FiscalRepositoryImpl extends FiscalRepository {
  final RemoteDataSource remoteDataSource;
  final AuthLocalDataSourceImpl localDataSource;

  FiscalRepositoryImpl(this.remoteDataSource, this.localDataSource);

  @override
  Future<List<FiscalYear>> getFiscalYearData() async {
    try {
      String token = _getToken();
      ServerResponseDto serverResponse =
          await remoteDataSource.getFiscalYearData(token: token);
      if (serverResponse.isSuccess) {
        List<FiscalYear> fiscalYearList = [];

        final itemsAsMap = serverResponse.data!.findAsDynamic('items');
        fiscalYearList = List<FiscalYear>.from(itemsAsMap.map((data) {
          return FiscalYearDto.fromMap(data);
        }));
        return fiscalYearList;
      } else {
        throw Exception();
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<int> setCurrentFiscalYear(
      SetCurrentFiscalYearParam activeYearId) async {
    SetCurrentFiscalYearParamDto param =
        SetCurrentFiscalYearParamDto(id: activeYearId.id);
    try {
      String token = _getToken();
      ServerResponseDto serverResponse = await remoteDataSource
          .setCurrentFiscalYear(token: token, param: param);
      if (serverResponse.isSuccess) {
        return serverResponse.result;
      } else {
        throw Exception();
      }
    } catch (e) {
      rethrow;
    }
  }

  String _getToken() {
    return localDataSource.getToken();
  }
}
