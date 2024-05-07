import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:toolo_gostar/data/models/accounting/document/body/create_document_detail_body_dto.dart';
import 'package:toolo_gostar/data/models/accounting/document/params/document_master_detail_param_dto.dart';
import 'package:toolo_gostar/data/models/accounting/document/params/document_total_price_param_dto.dart';
import 'package:toolo_gostar/di/di.dart';
import 'package:toolo_gostar/domain/entities/accounting/document/doc_total_price.dart';
import 'package:toolo_gostar/domain/entities/accounting/document/document_master.dart';
import 'package:toolo_gostar/domain/entities/accounting/document/document_master_detail.dart';
import 'package:toolo_gostar/domain/usecases/accounting/create_document_detail_use_case.dart';
import 'package:toolo_gostar/domain/usecases/accounting/document_master_detail_use_case.dart';
import 'package:toolo_gostar/domain/usecases/accounting/document_total_price_use_case.dart';

part 'doc_detail_event.dart';

part 'doc_detail_state.dart';

class DocDetailBloc extends Bloc<DocDetailEvent, DocDetailState> {
  DocumentMaster? currentDocMaster;

  DocDetailBloc() : super(DocDetailInitial()) {
    on<DocFetchDocumentDetail>(_fetchDocumentDetail);
    on<DocUpdateDocumentDetailData>(_updateDocumentDetailData);
    on<DocFetchDocumentDetailTotalPrice>(_fetchDocumentDetailTotalPrice);
    on<DocCreateDocumentDetail>(_createDocumentDetail);
  }

  FutureOr<void> _fetchDocumentDetail(
      DocFetchDocumentDetail event, Emitter<DocDetailState> emit) async {
    //add(FetchBaseData());
    emit(DocLoadingOnView(isShow: true));
    FetchDocumentMasterDetailListUseCase useCase =
        locator<FetchDocumentMasterDetailListUseCase>();
    final List<DocumentMasterDetail> items =
        await useCase(documentMasterDetailParamDto: event.param);
    emit(DocLoadingOnView(isShow: false));
    await Future.delayed(const Duration(milliseconds: 50));
    emit(SuccessFetchDocumentDetail(documentMasterDetailList: items));
  }

  FutureOr<void> _fetchDocumentDetailTotalPrice(
      DocFetchDocumentDetailTotalPrice event,
      Emitter<DocDetailState> emit) async {
    FetchDocumentTotalPriceUseCase useCase =
        locator<FetchDocumentTotalPriceUseCase>();
    DocumentTotalPrice documentTotalPrice =
        await useCase(documentTotalPriceParamDto: event.param);
    await Future.delayed(const Duration(milliseconds: 50));
    emit(
        SuccessFetchDocumentTotalPrice(documentTotalPrice: documentTotalPrice));
  }

  FutureOr<void> _updateDocumentDetailData(
      DocUpdateDocumentDetailData event, Emitter<DocDetailState> emit) async {
    emit(UpdateDocumentDetailData(
        documentMasterDetail: event.documentMasterDetail));
  }

  FutureOr<void> _createDocumentDetail(
      DocCreateDocumentDetail event, Emitter<DocDetailState> emit) async {
    try {
      emit(DocLoadingOnView(isShow: true));
      CreateDocumentDetailUseCase useCase =
          locator<CreateDocumentDetailUseCase>();
      bool isSuccess = await useCase(documentDetailBodyDto: event.param);
      emit(DocLoadingOnView(isShow: false));
      await Future.delayed(const Duration(milliseconds: 50));
      emit(CreateDocumentDetailStatus(isSuccess: isSuccess));
    } catch (e) {
      emit(CreateDocumentDetailStatus(isSuccess: false));
    }
  }
}
