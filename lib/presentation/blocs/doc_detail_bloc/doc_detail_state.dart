part of 'doc_detail_bloc.dart';

@immutable
abstract class DocDetailState extends Equatable {}

class DocDetailInitial extends DocDetailState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class DocLoadingOnView extends DocDetailState {
  final bool isShow;

  DocLoadingOnView({required this.isShow});

  @override
  List<Object?> get props => [isShow];
}

class UpdateDocumentDetailData extends DocDetailState {
  final DocumentMasterDetail documentMasterDetail;

  UpdateDocumentDetailData({required this.documentMasterDetail});

  @override
  List<Object?> get props => [documentMasterDetail];
}

class SuccessFetchDocumentDetail extends DocDetailState {
  final List<DocumentMasterDetail> documentMasterDetailList;

  SuccessFetchDocumentDetail({required this.documentMasterDetailList});

  @override
  List<Object?> get props => [SuccessFetchDocumentDetail];
}

class SuccessFetchDocumentTotalPrice extends DocDetailState {
  final DocumentTotalPrice documentTotalPrice;

  SuccessFetchDocumentTotalPrice({required this.documentTotalPrice});

  @override
  List<Object?> get props => [documentTotalPrice];
}

class CreateDocumentDetailStatus extends DocDetailState {
  final bool isSuccess;

  CreateDocumentDetailStatus({required this.isSuccess});

  @override
  List<Object?> get props => [isSuccess];
}