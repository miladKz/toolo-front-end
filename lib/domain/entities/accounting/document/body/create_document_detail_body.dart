import 'package:toolo_gostar/domain/entities/accounting/document/body/document_detail_body.dart';
import 'package:toolo_gostar/domain/entities/accounting/document/body/tafzili_data_body.dart';

class CreateDocumentDetailBody {
final DocumentDetailBody documentDetailBody;
final List<TafziliDataBody> tafziliDataBodyList;

  CreateDocumentDetailBody({required this.documentDetailBody, required this.tafziliDataBodyList});
}
