class ServerResponseDto {
  final int result;
  final String message;
  final String debugMessage;
  late final Map<String, dynamic>? data;

  ServerResponseDto({required this.result,this.message = "", this.debugMessage = "", this.data});

  factory ServerResponseDto.fromMap(Map<String, dynamic> map) {
    return ServerResponseDto(
      result: map['Result'],
      message: map['Message'],
      debugMessage: map.containsKey('DebugMessage') ? map['DebugMessage'] : "",
      data: map['MetaData'],
    );
  }

  bool get isSuccess => result > 0;
}
