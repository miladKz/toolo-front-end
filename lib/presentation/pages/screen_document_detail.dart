import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toolo_gostar/atras_direction.dart';
import 'package:toolo_gostar/data/models/accounting/document/params/document_master_detail_param_dto.dart';
import 'package:toolo_gostar/di/di.dart';
import 'package:toolo_gostar/domain/entities/accounting/document/document_master.dart';
import 'package:toolo_gostar/main.dart';
import 'package:toolo_gostar/presentation/blocs/doc_detail_bloc/doc_detail_bloc.dart';
import 'package:toolo_gostar/presentation/widgets/common/modals/modal_elements/custom_dialog.dart';
import 'package:toolo_gostar/presentation/widgets/common/progress_dialog.dart';
import 'package:toolo_gostar/presentation/widgets/main/documents/document_detail_page.dart';
import 'package:toolo_gostar/presentation/widgets/main/documents/modals/new_document_row_modal.dart';

class ScreenDocumentDetail extends StatefulWidget {
  const ScreenDocumentDetail({super.key, required this.documentMaster});

  final DocumentMaster documentMaster;

  @override
  State<ScreenDocumentDetail> createState() => _ScreenDocumentDetailState();
}

class _ScreenDocumentDetailState extends State<ScreenDocumentDetail> {
  @override
  void initState() {
    super.initState();
    locator.get<DocDetailBloc>().add(DocFetchDocumentDetail(
        param: DocumentMasterDetailParamDto(
            voucherMSID: widget.documentMaster.id)));
  }

  @override
  Widget build(BuildContext context) {
    locator.get<DocDetailBloc>().currentDocMaster = widget.documentMaster;
    return Scaffold(
      body: Directionality(
          textDirection: atrasDirection(context),
          child: BlocListener<DocDetailBloc, DocDetailState>(
            listener: (context, state) {
              if (state is DocLoadingOnView) {
                debugPrint(
                    'ScreenDocumentDetail MainLoadingOnView. state.isShow:${state.isShow}');
                //isDisable = true;
                progressDialog(isShow: state.isShow);
              }
            },
            child: BlocBuilder<DocDetailBloc, DocDetailState>(
              buildWhen: (previous, current) {
                if (current is SuccessFetchDocumentDetail) {
                  return true;
                }
                return false;
              },
              builder: (context, state) {
                if (state is SuccessFetchDocumentDetail) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.white,
                        border: Border.all(
                            width: 1, color: const Color(0xFFDCDCDC)),
                      ),
                      child: DocumentDetailPage(
                          documentMasterDetailList:
                              state.documentMasterDetailList,
                          documentMaster: widget.documentMaster),
                    ),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          )),
    );
  }
}

class ShowCreateOrUpdateDocumentDetailModal extends StatelessWidget {
  ShowCreateOrUpdateDocumentDetailModal({
    super.key,
    required this.maxWidth,
    required this.isCreate,
  });

  final double maxWidth;
  final bool isCreate;
  final docBloc = locator.get<DocDetailBloc>();

  @override
  Widget build(BuildContext context) {
    final Widget body = NewDocumentRowModal(
      formWidth: maxWidth,
      formKey: GlobalKey<FormState>(),
      voucherMSID: 10,
      onCreateOrUpdateStatus: (bool isSuccess) {
        onCreateOrUpdateStatus(isSuccess);
      },
    );

    return BlocProvider<DocDetailBloc>.value(
      value: docBloc,
      child: CustomDialog(
          title: localization.titleNewRow, width: maxWidth, body: body),
    );
  }

  void onCreateOrUpdateStatus(bool isSuccess) {
    if (isSuccess) {
      if (locator.get<DocDetailBloc>().currentDocMaster != null) {
        int id = locator.get<DocDetailBloc>().currentDocMaster!.id;
        locator.get<DocDetailBloc>().add(DocFetchDocumentDetail(
            param: DocumentMasterDetailParamDto(voucherMSID: id)));
      }
    }
  }
}
