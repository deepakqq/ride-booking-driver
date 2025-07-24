class ApiResponseModel<T> {
  final bool success;
  final String? message;
  final T? data;

  ApiResponseModel({required this.success, this.message, this.data});

  factory ApiResponseModel.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic json) fromJsonT,
  ) {
    return ApiResponseModel<T>(
      success: json['success'] ?? false,
      message: json['message'],
      data: json['data'] != null ? fromJsonT(json['data']) : null,
    );
  }
}
