class IdentificationParams {
  final String requestId;
  final String code;

  IdentificationParams({
    required this.requestId,
    required this.code,
  });

  Map<String, dynamic> toJson() {
    return {
      'request_id': requestId,
      'code': code,
    };
  }
}
