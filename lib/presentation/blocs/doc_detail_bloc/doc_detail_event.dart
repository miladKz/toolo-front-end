part of 'doc_detail_bloc.dart';

@immutable
abstract class DocDetailEvent {}

class DocUpdateDocumentDetailData extends DocDetailEvent {
  final DocumentMasterDetail documentMasterDetail;

  DocUpdateDocumentDetailData({required this.documentMasterDetail});
}

class DocFetchDocumentDetail extends DocDetailEvent {
  final DocumentMasterDetailParamDto param;

  DocFetchDocumentDetail({required this.param});
}

class DocFetchDocumentDetailTotalPrice extends DocDetailEvent {
  final DocumentTotalPriceParamDto param;

  DocFetchDocumentDetailTotalPrice({required this.param});
}

class DocCreateDocumentDetail extends DocDetailEvent {
  final CreateDocumentDetailBodyDto param;

  DocCreateDocumentDetail({required this.param});
}
