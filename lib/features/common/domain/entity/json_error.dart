class JsonError {
  final String path;
  final String error;

  JsonError({required this.path, required this.error});

  factory JsonError.fromJson(Map<String, dynamic> json) {
    return JsonError(
      path: json['path'] ?? '',
      error: json['error'] ?? '',
    );
  }
}
