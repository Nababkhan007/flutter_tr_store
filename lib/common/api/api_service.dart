import 'package:dio/dio.dart';
import 'package:tr_store/common/api/api_constants.dart';

class ApiService {
  Dio? _dio;

  ApiService() {
    BaseOptions options = BaseOptions(
      baseUrl: ApiUrls.urlBase,
      contentType: ApiParams.paramContentType,
      receiveTimeout: const Duration(
        minutes: 1,
      ),
      connectTimeout: const Duration(
        minutes: 1,
      ),
      responseType: ResponseType.plain,
    );
    _dio = Dio(options);
  }

  Future get(
    String endpoint, {
    Map<String, dynamic> params = const {},
    bool isHeader = false,
    String authToken = "",
    required Function() beforeSend,
    required Function(dynamic data)? onSuccess,
    required Function(dynamic error)? onError,
  }) async {
    if (isHeader) {
      _dio!.options.headers[ApiParams.authorization] = "${ApiParams.paramBearer} $authToken";
    }

    try {
      Response? response = await _dio!.get(endpoint, queryParameters: params);
      if (onSuccess != null) onSuccess(response.data.toString());
    } on DioException catch (exception) {
      if (onError != null) if (exception.response != null) onError(exception.response.toString());
    }
  }
}
