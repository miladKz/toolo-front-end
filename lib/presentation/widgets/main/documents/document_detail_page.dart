import 'package:atras_data_parser/atras_data_parser.dart';
import 'package:flutter/material.dart';
import 'package:toolo_gostar/data/models/accounting/document/document_master_detail_dto.dart';
import 'package:toolo_gostar/di/di.dart';
import 'package:toolo_gostar/domain/entities/accounting/document/document_master.dart';
import 'package:toolo_gostar/domain/entities/accounting/document/document_master_detail.dart';
import 'package:toolo_gostar/presentation/blocs/doc_detail_bloc/doc_detail_bloc.dart';
import 'package:toolo_gostar/presentation/blocs/main_bloc/main_bloc.dart';
import 'package:toolo_gostar/presentation/factories/table_view_model_factory.dart';
import 'package:toolo_gostar/presentation/view_models/table_view_model.dart';
import 'package:toolo_gostar/presentation/widgets/common/modals/custom_view_with_data_table.dart';
import 'package:toolo_gostar/presentation/widgets/main/actions_toolbar/actions_toolbar.dart';
import 'package:toolo_gostar/presentation/widgets/main/actions_toolbar/toolbar_enum.dart';
import 'package:toolo_gostar/presentation/widgets/main/documents/document_detail_form.dart';

class DocumentDetailPage extends StatefulWidget {
  const DocumentDetailPage(
      {super.key,
      required this.documentMasterDetailList,
      required this.documentMaster});

  final DocumentMaster documentMaster;
  final List<DocumentMasterDetail> documentMasterDetailList;

  @override
  State<DocumentDetailPage> createState() => _DocumentDetailPageState();
}

class _DocumentDetailPageState extends State<DocumentDetailPage> {

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double detailFormWidth = constraints.maxWidth * 0.2;
        final double tableWidth = constraints.maxWidth * 0.8;
        DataTableViewModel dataTableViewModel = DataTableViewModelFactory
            .createTableViewModelFromAccountingDocumentMasterDetail(
                documentMasterDetail: widget.documentMasterDetailList);
        final formKey = GlobalKey<FormState>();
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Flex(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            direction: Axis.horizontal,
            children: [
              Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child:  Column(
                    children: [
                      myCustomToolbar(
                          toolBarEnum: ToolBarEnum.accountDocumentDetailMainToolbar,isActionShow: true),
                      CustomViewWithDataTable(
                          isShowActionButtons: false,
                          isShowSearchBox: false,
                          backgroundColor: const Color(0xffF8F8F8),
                          formWidth: tableWidth,
                          onTap: (data) {
                            DocumentMasterDetail documentDetail=data as DocumentMasterDetailDto;
                            locator.get<DocDetailBloc>().add(DocUpdateDocumentDetailData(documentMasterDetail:documentDetail));
                          },
                          viewModel: dataTableViewModel,
                          formKey: formKey),
                    ],
                  ),
                ),
              ),
              DocumentDetailForm(
                      width: detailFormWidth+20,
                      maxHeight: constraints.maxHeight,
                      masterDoc: widget.documentMaster)
            ],
          ),
        );
      },
    );
  }
}
