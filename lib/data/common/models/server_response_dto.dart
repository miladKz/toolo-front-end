import 'package:atras_data_parser/atras_data_parser.dart';

class ServerResponseDto {
  final int result;
  final String message;
  final String debugMessage;
  late final Map<String, dynamic>? data;

  ServerResponseDto(
      {required this.result,
      this.message = "",
      this.debugMessage = "",
      this.data});

  factory ServerResponseDto.fromMap(Map<String, dynamic> map) {
    return ServerResponseDto(
      result: map.findAsInt('Result'),
      message: map.findAsString('Message'),
      debugMessage: map.findAsString('DebugMessage'),
      data: map.findAsDynamic('MetaData'),
    );
  }

  bool get isSuccess => result > 0;
}
