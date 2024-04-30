import 'package:atras_data_parser/atras_data_parser.dart';
import 'package:toolo_gostar/domain/entities/accounting/document/doc_total_price.dart';

class DocumentTotalPriceDto extends DocumentTotalPrice {
  DocumentTotalPriceDto(
      {required super.articleTotalPrice,
      required super.bedArticleTotalPrice,
      required super.bedTotalPrice,
      required super.besArticleTotalPrice,
      required super.besTotalPrice,
      required super.totalPrice});

  factory DocumentTotalPriceDto.fromMap(Map<String, dynamic> map) {
    return DocumentTotalPriceDto(
      articleTotalPrice: map.findAsDouble('ArticleTotalPrice'),
      bedArticleTotalPrice: map.findAsDouble('BedArticleTotalPrice'),
      bedTotalPrice: map.findAsDouble('BedTotalPrice'),
      besArticleTotalPrice: map.findAsDouble('BesArticleTotalPrice'),
      besTotalPrice: map.findAsDouble('BesTotalPrice'),
      totalPrice: map.findAsDouble('TotalPrice'),
    );
  }
}
