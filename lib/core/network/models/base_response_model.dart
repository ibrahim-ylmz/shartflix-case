class ResponseInfo {
  final int code;
  final String message;

  ResponseInfo({required this.code, required this.message});

  factory ResponseInfo.fromJson(Map<String, dynamic> json) {
    return ResponseInfo(
      code: (json['code'] as int?) ?? 0,
      message: (json['message'] as String?) ?? '',
    );
  }
}

class BaseResponseModel<T> {
  final ResponseInfo response;
  final T data;

  BaseResponseModel({required this.response, required this.data});

  factory BaseResponseModel.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    return BaseResponseModel(
      response: ResponseInfo.fromJson(json['response'] as Map<String, dynamic>),
      data: fromJsonT(json['data']),
    );
  }
}
